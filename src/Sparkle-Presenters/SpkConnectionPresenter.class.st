Class {
	#name : 'SpkConnectionPresenter',
	#superclass : 'SpkPresenter',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkConnectionPresenter class >> connectionProfileClass [

	^self subclassResponsibility 
]
