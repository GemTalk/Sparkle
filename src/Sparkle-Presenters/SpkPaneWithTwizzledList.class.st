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

	self
		refreshListModel;
		refreshList.
	twizzledList labelString: self listLabelString
]
