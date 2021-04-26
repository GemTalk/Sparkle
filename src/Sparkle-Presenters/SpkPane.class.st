"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.


**Instance Variables**
* coordinate	<SpkPaneCoordinate> Determines the position of this pane in its window, relative to other panes.
* linkedFrom		<nil or some presentation layer object> If I am linked to a parent, the object that has me as its linkedPane. Examples of objects with linked panes: InspectorField, Evaluator.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpkPresenterWithHeader',
	#traits : 'SpkTLayoutService',
	#classTraits : 'SpkTLayoutService classTrait',
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
	"enableAll, paradoxically, has the action of disabling 
	buttons that should be disabled when the pane first opens.
	Otherwise, all widgets start enabled.
	Enabling doesn't do all it needs to do if the subscriptions
	are not in place yet, so defer."
	self defer: [self enableAll].
]

{ #category : 'accessing' }
SpkPane >> coordinate [
	^ coordinate
]

{ #category : 'accessing' }
SpkPane >> coordinate: aCoordinate [

	coordinate := aCoordinate
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

{ #category : 'tests - header' }
SpkPane >> headerClass [

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkPane >> initialize [

	super initialize.
	coordinate := SpkPaneCoordinate new.
	isOpen := true
]

{ #category : 'initialization' }
SpkPane >> initializeHeader [

	header := self instantiate: self headerClass on: model.
	self layout
		add: header
		withConstraints: [ :c | c height: header headerHeight ]
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

	linkedFrom := anObject
]

{ #category : 'accessing' }
SpkPane >> linkedPanes [

	^ #(  )
]

{ #category : 'accessing' }
SpkPane >> menuActions [

	^ CmCommandGroup forSpec
		  beRoot;
		  yourself
]

{ #category : 'accessing' }
SpkPane >> newLayout [

	^ SpkAccordianLayout newVertical
		  color: Color veryVeryDarkGray;
			borderWidth: 3;
		  yourself
]

{ #category : 'instance creation' }
SpkPane >> newPaneForService: newService linkedTo: item [

	"Item is anything that can have a linked pane.
	Usually a list item or an evaluator"

	"If I have been closed before the new pane announcement reaches me, ignore it."

	isOpen ifFalse: [ ^ self ].
	self openLinkedPane: newService forItem: item
]

{ #category : 'accessing' }
SpkPane >> nonChildSlotNames [

	^ super nonChildSlotNames , #( #linkedFrom )
]

{ #category : 'actions' }
SpkPane >> openLinkedPane: aPaneService forItem: item [

	" Create and open a pane in the next column.
	Generic part is here, see subclasses for detailed use."

	| nextRightColumn newPane |
	nextRightColumn := item column nextRightColumn.
	"Ask the column, since it must own the new pane."
	newPane := nextRightColumn presenterForService: aPaneService.
	newPane coordinate: (item coordinateRelativeTo: coordinate).
	"Add before close so that the column doesn't become empty and remove itself"
	nextRightColumn add: newPane.
	item
		closeLinkedPane;
		linkedPane: newPane
]

{ #category : 'initialization' }
SpkPane >> receiveActionCompleteAnnouncement [ 
	
	self defer: [ self actionComplete ]
]

{ #category : 'announcements' }
SpkPane >> receiveLinkedPaneAnnouncement: anAnnouncement [

	self defer: [ 
		self
			newPaneForService: anAnnouncement service
			linkedTo: anAnnouncement requestId ]
]

{ #category : 'initialization' }
SpkPane >> receiveUpdateAnnouncement [ 
	
	self defer: [ self updateFromModel ]
]

{ #category : 'menu messages' }
SpkPane >> redo [

	^ model redo
]

{ #category : 'initialization' }
SpkPane >> setCoordinateFromLayoutService [

	coordinate := SpkPaneCoordinate forVector:
		              self layoutService paneCoordinate
]

{ #category : 'menu messages' }
SpkPane >> undo [

	^ model undo
]

{ #category : 'initialization' }
SpkPane >> updateFromModel [
	"Must be sent only in the UI thread."
	"Subclasses should override if they can receive update announcements"
]
