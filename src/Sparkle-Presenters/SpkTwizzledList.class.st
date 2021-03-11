"
A presenter for an SpkMultiSelectList within a pane, which can be twizzled to show and hide the list.
The pane is in charge of populating and updating the listModel, and for handling selection and deselection of items.

Internal Representation and Key Implementation Points.

    Instance Variables
	list:		<Object>
	listModel:		<Object>
	pane:		<Object>
	twizzledPresenter:		<Object>


    Implementation Points
"
Class {
	#name : 'SpkTwizzledList',
	#superclass : 'SpkPresenter',
	#instVars : [
		'pane',
		'list',
		'listModel',
		'twizzledPresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'adding' }
SpkTwizzledList >> addColumnEvaluated: aValuable [

	list addColumn: (SpStringTableColumn evaluated: aValuable)
]

{ #category : 'initialization' }
SpkTwizzledList >> initializeList [

	self initializeListModel.
	list := self newTable.
	list
		whenSelectionChangedDo: [ :selectionMode | 
			model selectedIndexes: selectionMode selectedIndexes ];
		items: model.
	pane initializeListColumns.
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
SpkTwizzledList >> initializeListModel [

	model := SpkMultiSelectList new.
	self refreshListModel.
	model
		pane: pane;
		when: SpkItemSelected send: #itemSelected: to: pane;
		when: SpkItemDeselected send: #itemDeselected: to: pane
]

{ #category : 'initialization' }
SpkTwizzledList >> panesLinkedToListItems [

	^ model linkedPanes
]

{ #category : 'initialization' }
SpkTwizzledList >> refreshListModel [

	model
		updateItemQuantity: model listItems size;
		refreshFrom: model listItems
]

{ #category : 'updating' }
SpkTwizzledList >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	list selectIndexes: model selectedIndexes
]
