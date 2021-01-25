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
SpkPaneWithList >> initializeList [

	self initializeListModel.
	list := self newTable.
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

{ #category : 'initialization' }
SpkPaneWithList >> initializeListModel [

	| items |
	listModel := SpkMultiSelectList new.
	items := self listItemModels collect: [ :each | 
		         (SpkMultiSelectListItem for: each)
			         list: listModel;
			         yourself ].
	listModel
		addAll: items;
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
SpkPaneWithList >> list [

	^ list
]

{ #category : 'as yet unclassified' }
SpkPaneWithList >> listItemModels [

	"Answer the collection of services that correspond to my list items."

	self subclassResponsibility
]

{ #category : 'actions' }
SpkPaneWithList >> openLinkedPane: aPaneService forItem: item [

	"Specific to a pane linked from a list item. Other linked panes are possible."

	super openLinkedPane: aPaneService forItem: item.
	self refreshList "Change linking arrow."
]

{ #category : 'private' }
SpkPaneWithList >> panesLinkedToListItems [

	^ listModel linkedPanes
]

{ #category : 'refreshing' }
SpkPaneWithList >> refreshList [

	list refresh
]

{ #category : 'updating' }
SpkPaneWithList >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	list selectIndexes: listModel selectedIndexes
]
