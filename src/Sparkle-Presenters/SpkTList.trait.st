"
Trait that gives a presenter a multi-select list with linked panes for selected items.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	list:		<SpkMultipleSelectionTablePresenter> The GUI of the list
	listModel:		<SpkMultiSelectList> Holds SpkMultiSelectListItems, each of which has a service as a model

"
Trait {
	#name : 'SpkTList',
	#instVars : [
		'list',
		'listModel'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'initialization' }
SpkTList >> initializeList [

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

{ #category : 'actions' }
SpkTList >> initializeListModel [

	listModel := SpkMultiSelectList new.
	listModel
		pane: self;
		when: SpkItemSelected send: #itemSelected: to: self;
		when: SpkItemDeselected send: #itemDeselected: to: self
]

{ #category : 'actions' }
SpkTList >> itemDeselected: anAnnouncement [

	"This announcement comes from the UI, not a service,
	so does not need to be deferred."

	| item |
	item := anAnnouncement item.
	"If the close was initiated by the linked pane, 
	it will already be closed and removed from the field."
	item linkedPane ifNotNil: [ :linkedPane | linkedPane close ].
	self updateSelection
]

{ #category : 'accessing' }
SpkTList >> itemsWithLinkedPanes [

	"Returns all list items with linked panes. May be overridden if additional
	items exist outside of the list."

	^listModel itemsWithLinkedPanes
]

{ #category : 'accessing' }
SpkTList >> list [

	^ list
]

{ #category : 'api' }
SpkTList >> listItemServices [

	^ self model listItems
]

{ #category : 'accessing' }
SpkTList >> listModel [

	^ listModel
]

{ #category : 'api - shortcuts' }
SpkTList >> listSize [

	^ listModel size
]

{ #category : 'actions' }
SpkTList >> openLinkedPane: aPaneService forItem: item [

	" Create and open a pane in the next column.
	Item is a list item."

	| nextRightColumn newPane |
	nextRightColumn := item column nextRightColumn.
	"Ask the column, since it must own the new pane."
	newPane := nextRightColumn presenterForService: aPaneService.
	newPane coordinate: (item coordinateRelativeTo: self coordinate).
	"Add before close so that the column doesn't become empty and remove itself"
	nextRightColumn add: newPane.
	item
		closeLinkedPane;
		linkedPane: newPane.
	self refreshList "Change linking arrow."
]

{ #category : 'accessing' }
SpkTList >> panesLinkedToListItems [

	^ listModel linkedPanes
]

{ #category : 'refreshing' }
SpkTList >> refreshList [

	"Refresh list presenter from MultiSelectList -- 
	does not involve services or the server"

	list refresh
]

{ #category : 'initialization' }
SpkTList >> refreshListModel [

	"Fully refresh from current state of local services.
	Does not cause a server round trip."

	listModel refreshFromServices: self model listItems.
	self
		updateSelection;
		refreshList;
		updateLinkedPaneCoordinates
]

{ #category : 'updating' }
SpkTList >> updateLinkedPaneCoordinates [

	"Recalculate the coordinates for all linked panes affected by
	an updates which affect the coordinates for the receiver or
	subpanes."

	self itemsWithLinkedPanes do: [ :item | 
		item linkedPane coordinate:
			(item coordinateRelativeTo: self coordinate) ]
]

{ #category : 'updating' }
SpkTList >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	list selectIndexes: listModel selectedIndexes
]
