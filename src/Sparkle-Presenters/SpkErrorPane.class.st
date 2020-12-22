Class {
	#name : 'SpkErrorPane',
	#superclass : 'SpkPane',
	#instVars : [
		'textPresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkErrorPane >> errorText [

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkErrorPane >> initializeHeader [

	header := self instantiate: SpkErrorPaneHeader on: model.
	self layout add: header withConstraints: [ :c | c height: 30 ]
]

{ #category : 'initialization' }
SpkErrorPane >> initializePresenters [

	super initializePresenters.
	header labelString: self labelString.
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
SpkErrorPane >> menuActions [

	
]

{ #category : 'accessing' }
SpkErrorPane >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'accessing' }
SpkErrorPane >> textPresenter [

	^ textPresenter
]

{ #category : 'accessing' }
SpkErrorPane >> textPresenter: anObject [

	textPresenter := anObject
]
