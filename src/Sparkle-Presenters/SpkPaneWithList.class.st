Class {
	#name : 'SpkPaneWithList',
	#superclass : 'SpkPane',
	#instVars : [
		'list',
		'listModel'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkPaneWithList >> connectPresenters [

	super connectPresenters.
	header menu: self menuCommandGroup asMenuPresenter.
	model when: SpkPaneServiceAnnouncement send: #receiveLinkedPaneAnnouncement: to: self
]

{ #category : 'accessing' }
SpkPaneWithList >> coordinate: aCoordinate [

	coordinate = aCoordinate
		ifTrue: [^self].
	super coordinate: aCoordinate.
	self updateLinkedPaneCoordinates
]

{ #category : 'initialization' }
SpkPaneWithList >> initializeListColumns [

	self subclassResponsibility 
	
]

{ #category : 'actions' }
SpkPaneWithList >> itemDeselected: anAnnouncement [

	"This announcement comes from the UI, not a service,
	so does not need to be deferred."

	| item |
	item := anAnnouncement item.
	"If the close was initiated by the linked pane, 
	it will already be closed and removed from the field."
	item linkedPane ifNotNil: [ :linkedPane | linkedPane close ].
	self updateSelection
]

{ #category : 'actions' }
SpkPaneWithList >> itemSelected: anAnnouncement [

	"This announcement comes from the UI, not a service,
	so does not need to be deferred."

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkPaneWithList >> linkedPanes [

	^ self panesLinkedToListItems
]

{ #category : 'api' }
SpkPaneWithList >> listItemServices [

	^ model listItems
]

{ #category : 'actions' }
SpkPaneWithList >> openLinkedPane: aPaneService forItem: item [

	"Specific to a pane linked from a list item. Other linked panes are possible."

	super openLinkedPane: aPaneService forItem: item.
	self refreshList "Change linking arrow."
]

{ #category : 'initialization' }
SpkPaneWithList >> refreshListModel [

	listModel refreshFromServices: model listItems.
	self updateSelection
]

{ #category : 'updating' }
SpkPaneWithList >> updateLinkedPaneCoordinates [

	"Recalculate the coordinates for all linked panes affected by
	an updates which affect the coordinates for the receiver or
	subpanes."

	self itemsWithLinkedPanes do: [:item | item linkedPane coordinate: (item coordinateRelativeTo: coordinate)].
]
