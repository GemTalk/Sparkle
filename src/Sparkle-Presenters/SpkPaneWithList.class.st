Class {
	#name : 'SpkPaneWithList',
	#superclass : 'SpkPane',
	#instVars : [
		'list',
		'listModel',
		'twizzledList'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkPaneWithList >> connectPresenters [

	super connectPresenters.
	header menu: self menuActions asMenuPresenter.
	model when: SpkNewPaneService send: #receiveLinkedPaneAnnouncement: to: self
]

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

{ #category : 'actions' }
SpkPaneWithList >> initializeListModel [

	listModel := SpkMultiSelectList new.
	self refreshListModel.
	listModel
		pane: self;
		when: SpkItemSelected send: #itemSelected: to: self;
		when: SpkItemDeselected send: #itemDeselected: to: self
]

{ #category : 'initialization' }
SpkPaneWithList >> initializeTwizzledList [

	self initializeList.
	twizzledList := self instantiate: SpkTwizzledPresenter.
	twizzledList
		labelString: self listLabelString;
		subPresenter: list;
		showSubPresenter: true
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

{ #category : 'as yet unclassified' }
SpkPaneWithList >> listLabelString [

	self subclassResponsibility
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

	listModel
		updateItemQuantity: model listItems size;
		refreshFromServices: model listItems
]

{ #category : 'updating' }
SpkPaneWithList >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	list selectIndexes: listModel selectedIndexes
]
