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
	self refreshListModel.
	listModel
		pane: self;
		when: SpkItemSelected send: #itemSelected: to: self;
		when: SpkItemDeselected send: #itemDeselected: to: self
]

{ #category : 'accessing' }
SpkTList >> itemsWithLinkedPanes [

	"Returns all list items with linked panes. May be overridden if additional
	items exist outside of the list."

	^listModel itemsWithLinkedPanes
]

{ #category : 'as yet unclassified' }
SpkTList >> panesLinkedToListItems [

	^ listModel linkedPanes
]

{ #category : 'refreshing' }
SpkTList >> refreshList [

	list refresh
]

{ #category : 'updating' }
SpkTList >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	list selectIndexes: listModel selectedIndexes
]
