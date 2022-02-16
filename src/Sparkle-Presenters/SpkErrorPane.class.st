Class {
	#name : 'SpkErrorPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'textPresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkErrorPane >> errorText [

	self subclassResponsibility
]

{ #category : 'tests - header' }
SpkErrorPane >> headerClass [

	^ SpkErrorPaneHeader
]

{ #category : 'initialization' }
SpkErrorPane >> initializePresenters [

	super initializePresenters.
	self initializeHeader.
	self header labelString: self labelString.
	textPresenter := self newText
		                 beNotEditable;
		                 text: self errorText;
		                 yourself.
	self layout add: textPresenter
]

{ #category : 'accessing' }
SpkErrorPane >> labelString [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkErrorPane >> textPresenter [

	^ textPresenter
]

{ #category : 'accessing' }
SpkErrorPane >> textPresenter: anObject [

	textPresenter := anObject
]
