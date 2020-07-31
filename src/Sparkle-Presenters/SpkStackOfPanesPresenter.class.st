Class {
	#name : 'SpkStackOfPanesPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'panes',
		'stackLayout'
	],
	#category : 'Sparkle-Presenters'
}

{ #category : 'specs' }
SpkStackOfPanesPresenter class >> defaultSpec [
	"This method only here to quiet browser linting. Should never be sent to this class.
	See instance-side #layout."

	self error: '#defaultSpec sent when not expected'
]

{ #category : 'adding' }
SpkStackOfPanesPresenter >> add: aPane beforeIndex: index [
	self layout add: aPane beforeIndex: index
]

{ #category : 'accessing' }
SpkStackOfPanesPresenter >> layout [
	^ stackLayout ifNil: [ stackLayout := SpkAccordianLayout newVertical ]
]
