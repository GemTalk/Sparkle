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
		pane: self pane;
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
		refreshList
]

{ #category : 'refreshing' }
SpkTList >> updateCoordinatesBasedOn: initialSuffix [

	^ listModel updateCoordinatesBasedOn: initialSuffix
]

{ #category : 'updating' }
SpkTList >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	list selectIndexes: listModel selectedIndexes
]
