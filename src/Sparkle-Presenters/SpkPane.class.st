"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.


**Instance Variables**
* coordinate	<SpkPaneCoordinate> Determines the position of this pane in its window, relative to other panes.
* linkedFrom		<nil or some presentation layer object> If I am linked to a parent, the object that has me as its linkedPane. Examples of objects with linked panes: InspectorField, Evaluator.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'coordinate',
		'linkedFrom',
		'isOpen'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkPane >> actionComplete [

	"Must be sent only in the UI thread."

	self enableAll
]

{ #category : 'actions' }
SpkPane >> beIndependent [

	self canUnlink ifFalse: [ 
		self error: 'This pane cannot be made independent' ].
	self disableAll.
	model moveToNewExplorerFor: self
]

{ #category : 'testing' }
SpkPane >> canUnlink [

	"Answer true if I'm a pane that can become an independent pane"

	^ false
]

{ #category : 'initialize-release' }
SpkPane >> close [

	self linkedPanes do: [ :each | each close ].
	model unsubscribe: self.
	"A pane's owner is the column it's in."
	owner remove: self.
	isOpen := false.
	linkedFrom ifNotNil: [ linkedFrom closingLinkedPane: self ]
]

{ #category : 'events' }
SpkPane >> closeRequestedLocally [

	self close
]

{ #category : 'accessing' }
SpkPane >> column [

	"What column am I in?"

	^ owner
]

{ #category : 'initialization' }
SpkPane >> connectPresenters [

	super connectPresenters.
	model
		when: SpkUpdateAnnouncement
		send: #receiveUpdateAnnouncement
		to: self;
		when: SpkActionCompleteAnnouncement
		send: #receiveActionCompleteAnnouncement
		to: self.
	self canUnlink ifTrue: [ 
		model
			when: SpkIndependentExplorerAnnouncement
			send: #receiveIndependentExplorerAnnouncement:
			to: self ].
	"enableAll, paradoxically, has the action of disabling 
	buttons that should be disabled when the pane first opens.
	Otherwise, all widgets start enabled.
	Enabling doesn't do all it needs to do if the subscriptions
	are not in place yet, so defer."
	self defer: [ self enableAll ]
]

{ #category : 'accessing' }
SpkPane >> coordinate [
	^ coordinate
]

{ #category : 'accessing' }
SpkPane >> coordinate: aCoordinate [

	coordinate = aCoordinate ifTrue: [ ^ self ].
	coordinate := aCoordinate.
	self updateLinkedCoordinates
]

{ #category : 'layout' }
SpkPane >> defaultLayout [

	"Panes in general do not have splitters between their subparts. 
	Panes that do have splittable subparts (such as those with evaluator subpanes) 
	should override this method."

	^ SpkBoxLayout newVertical
		  color: Color veryVeryDarkGray;
		  yourself
]

{ #category : 'actions' }
SpkPane >> disableAll [

	"Disable all widgets in this pane so that we cannot get any GUI events while
	awaiting an answer from the server."

	self enabled: false
]

{ #category : 'actions' }
SpkPane >> enableAll [

	"Enable widgets in this pane after receiving a reply from the server.
At the moment, this does enable all widgets in the pane.
At some point, we will need to do something more sophisticated to determine whether
an item really should be enabled."

	self enabled: true
]

{ #category : 'accessing' }
SpkPane >> header [

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkPane >> initialize [

	super initialize.
	isOpen := true
]

{ #category : 'initialization' }
SpkPane >> initializePresenters [

	"Need a coordinate, even if bogus, for pieces to base their coordinates on.
	Coordinate will be set properly later."

	super initializePresenters.
	coordinate := SpkPaneCoordinate new
]

{ #category : 'testing' }
SpkPane >> isLinked [

	^ linkedFrom isNil not
]

{ #category : 'testing' }
SpkPane >> isPane [

	^ true
]

{ #category : 'accessing' }
SpkPane >> linkedFrom [

	^ linkedFrom
]

{ #category : 'accessing' }
SpkPane >> linkedFrom: anObject [

	linkedFrom := anObject.
	self linkedFromChanged
]

{ #category : 'events' }
SpkPane >> linkedFromChanged [

	self header showLinkage:
		(linkedFrom ifNotNil: [ :l | l linkageString ])
]

{ #category : 'accessing' }
SpkPane >> linkedPanes [

	^ self panesLinkedToListItems
]

{ #category : 'accessing' }
SpkPane >> menuCommandClasses [

	^#()
]

{ #category : 'accessing' }
SpkPane >> menuCommandGroup [

	| group |
	group := CmCommandGroup forSpec
		  beRoot;
			yourself.
	self menuCommands do: [:command | group register: command].
	^group
]

{ #category : 'accessing' }
SpkPane >> menuCommands [

	^self menuCommandClasses
		collect:
			[:each |
			(each forSpecContext: self)
				iconProvider: SpkIconLibrary current;
				yourself]
]

{ #category : 'actions' }
SpkPane >> movePresentersTo: explorer [

	linkedFrom clearLinkedPane.
	owner remove: self.

	"#addInitialPane changes owner and updates coordinates of all panes being moved."
	explorer addInitialPane: self.
	self linkedPanes do: [ :lPane | lPane moveToColumnRightOf: owner ]
]

{ #category : 'initialize-release' }
SpkPane >> moveToColumnRightOf: aColumn [

	"Move myself, and the transitive closure of my linked panes, to the column
	immediately to the right of the given column. This column may be in a different explorer
	from the one I'm currently in."

	| newOwner |
	owner remove: self.
	newOwner := aColumn nextRightColumn. "Creates if none extant"
	newOwner add: self.
	self owner: newOwner.
	self linkedPanes do: [ :lpane | lpane moveToColumnRightOf: owner ]
]

{ #category : 'instance creation' }
SpkPane >> newPaneForService: newService linkedTo: item [

	"Item is anything that can have a linked pane.
	Usually a list item or an evaluator"

	"If I have been closed before the new pane announcement reaches me, ignore it."

	isOpen ifFalse: [ ^ self ].
	item openLinkedPane: newService.
	self refreshList "If I have list, need to update linking arrows."
]

{ #category : 'accessing' }
SpkPane >> nonChildSlotNames [

	^ super nonChildSlotNames , #( #linkedFrom )
]

{ #category : 'accessing' }
SpkPane >> pane [

	^ self
]

{ #category : 'accessing' }
SpkPane >> panesLinkedToListItems [

	^ #(  )
]

{ #category : 'initialization' }
SpkPane >> receiveActionCompleteAnnouncement [ 
	
	self defer: [ self actionComplete ]
]

{ #category : 'announcements' }
SpkPane >> receiveIndependentExplorerAnnouncement: anAnnouncement [

	self defer: [ 
		| explorer |
		explorer := self application openWindowForService:
			            anAnnouncement xServ.
		anAnnouncement requestId movePresentersTo: explorer.
		self actionComplete ]
]

{ #category : 'announcements' }
SpkPane >> receivePaneServiceAnnouncement: anAnnouncement [

	(anAnnouncement requestId linkedPane isNil or: [ 
		 anAnnouncement service ~~ anAnnouncement requestId linkedPane model ]) 
		ifTrue: [ 
			self defer: [ 
				self
					newPaneForService: anAnnouncement service
					linkedTo: anAnnouncement requestId ] ]
]

{ #category : 'initialization' }
SpkPane >> receiveUpdateAnnouncement [ 
	
	self defer: [ self refreshFromService ]
]

{ #category : 'menu messages' }
SpkPane >> redo [

	^ model redo
]

{ #category : 'initialization' }
SpkPane >> refreshFromService [
	"Must be sent only in the UI thread."
	"Subclasses should override if they can receive update announcements"
]

{ #category : 'refreshing' }
SpkPane >> refreshList [

	"If I have a list, refresh it.
	Overridden by SpkTList to actually do something."

	
]

{ #category : 'actions' }
SpkPane >> replaceWithIndependentPaneFor: aPaneService [
	" Replace the existing pane with one defined by aPaneService."

	| column newPane |
	column := owner.
	"Ask the column, since it must own the new pane."
	newPane := column presenterForService: aPaneService.
	newPane coordinate: coordinate.
	"Add before close so that the column doesn't become empty and remove itself"
	column add: newPane.
	self close
]

{ #category : 'menu messages' }
SpkPane >> undo [

	^ model undo
]

{ #category : 'refreshing' }
SpkPane >> updateLinkedCoordinates [

	"By default do nothing. Overridden by subclasses, 
	especially those using SpkTList."
]

{ #category : 'initialization' }
SpkPane >> updatePresenter [

	"Sent by Spec2 in the UI thread, following #initializePresenters and #connectPresenters."

	self refreshFromService
]
