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

{ #category : 'initialization' }
SpkPaneWithList >> initializeList [

	list instantiate: SpkTwizzledList
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

{ #category : 'accessing' }
SpkPaneWithList >> list [

	^ list
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

{ #category : 'initialization' }
SpkPaneWithList >> refreshListModel [

	listModel
		updateItemQuantity: model listItems size;
		refreshFrom: model listItems
]

{ #category : 'updating' }
SpkPaneWithList >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	list selectIndexes: listModel selectedIndexes
]
