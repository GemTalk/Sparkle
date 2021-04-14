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
	header menu: self menuActions asMenuPresenter.
	model when: SpkNewPaneService send: #receiveLinkedPaneAnnouncement: to: self
]

{ #category : 'accessing' }
SpkPaneWithList >> coordinate: aCoordinate [

	coordinate = aCoordinate
		ifTrue: [^self].
	super coordinate: aCoordinate.
	self updateLinkedPaneCoordinates
]

{ #category : 'initialization' }
SpkPaneWithList >> initializeList [

	list := self newTable.
	self initializeListModel.
	list
		whenSelectionChangedDo: [ :selectionMode | 
			listModel selectedIndexes: selectionMode selectedIndexes ];
		items: listModel.
	self initializeListColumns.
	list
		addColumn: ((SpImageTableColumn evaluated: [ :item | 
					  item hasLinkedPane
						  ifTrue: [ self iconNamed: #hidePane16 ]
						  ifFalse: [ self iconNamed: #showPane16 ] ])
				 width: 25;
				 yourself);
		hideColumnHeaders
]

{ #category : 'initialization' }
SpkPaneWithList >> initializeListColumns [

	self subclassResponsibility 
	
]

{ #category : 'actions' }
SpkPaneWithList >> initializeListModel [

	listModel := SpkMultiSelectList new.
	self refreshListModel.
	listModel
		pane: self;
		when: SpkItemSelected send: #itemSelected: to: self;
		when: SpkItemDeselected send: #itemDeselected: to: self
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
SpkPaneWithList >> itemsWithLinkedPanes [

	"Returns all list items with linked panes. May be overridden if additional
	items exist outside of the list."

	^listModel itemsWithLinkedPanes
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

{ #category : 'as yet unclassified' }
SpkPaneWithList >> panesLinkedToListItems [

	^ listModel linkedPanes
]

{ #category : 'refreshing' }
SpkPaneWithList >> refreshList [

	list refresh
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

{ #category : 'updating' }
SpkPaneWithList >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	list selectIndexes: listModel selectedIndexes
]
