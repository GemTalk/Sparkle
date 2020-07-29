Class {
	#name : 'SpkColumnsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'columns',
		'columnLayout'
	],
	#category : 'Sparkle-Presenters'
}

{ #category : 'specs' }
SpkColumnsPresenter class >> defaultSpec [
	"This method only here to quiet browser linting. Should never be sent to this class.
	See instance-side #layout."

	self error: '#defaultSpec sent when not expected'
]

{ #category : 'adding' }
SpkColumnsPresenter >> addColumn [
	| newColumn |
	newColumn := self instantiate: SpkStackOfPanesPresenter.
	self layout addLast: newColumn
]

{ #category : 'initialization' }
SpkColumnsPresenter >> initialize [
	super initialize.
	columns := OrderedCollection new
]

{ #category : 'initialization' }
SpkColumnsPresenter >> initializeWindow: aWindowPresenter [
	application window: aWindowPresenter.
	super initializeWindow: aWindowPresenter
]

{ #category : 'accessing' }
SpkColumnsPresenter >> layout [
	^ columnLayout ifNil: [ 
		  columnLayout := SpkAccordianLayout newHorizontal ]
]
