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
		labelString: self listLabelString;
		subPresenter: list;
		showSubPresenter: true
]

{ #category : 'as yet unclassified' }
SpkPaneWithTwizzledList >> listLabelString [

	self subclassResponsibility
]
