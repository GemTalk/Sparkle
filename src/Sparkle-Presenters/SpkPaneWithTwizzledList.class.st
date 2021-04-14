Class {
	#name : 'SpkPaneWithTwizzledList',
	#superclass : 'SpkPaneWithList',
	#instVars : [
		'twizzledList'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkPaneWithTwizzledList >> initializeTwizzledList [

	self initializeList.
	twizzledList := self instantiate: SpkTwizzledPresenter.
	twizzledList
		subPresenter: list;
		showSubPresenter: true
]

{ #category : 'as yet unclassified' }
SpkPaneWithTwizzledList >> listLabelString [

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkPaneWithTwizzledList >> refreshTwizzledList [

	| listCount |
	listCount := listModel size.
	self
		refreshListModel;
		refreshList.
	listCount ~= listModel size
		ifTrue: [ self updateLinkedPaneCoordinates ].
	twizzledList labelString: self listLabelString.
]
