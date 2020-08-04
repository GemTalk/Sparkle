Class {
	#name : 'SpkColumnsPresenter',
	#superclass : 'SpkPresenter',
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
	columns addLast: newColumn.
	self layout addLast: newColumn
]

{ #category : 'accessing' }
SpkColumnsPresenter >> columnAt: anIndex [
	"Answer the SpkAccodianLayout for the given column. anIndex must be between 1 and my current number of columns."

	^ columns at: anIndex
]

{ #category : 'initialization' }
SpkColumnsPresenter >> initialize [
	"Must initialize columns first, since the super initialize depends on them being there."

	columns := OrderedCollection new.
	super initialize
]

{ #category : 'initialization' }
SpkColumnsPresenter >> initializeWindow: aWindowPresenter [
	application window: aWindowPresenter.
	aWindowPresenter
		title: 'Sparkle Object Explorer';
		aboutText:
			'The Sparkle object explorer is part of the Pharo IDE for GemStone, 
a set of tools for developing GemStone code via a remote connection from Pharo.

Enter code in the leftmost column. Accept to evaluate the code and inspect the result.';
		initialExtent: 500 @ 500
]

{ #category : 'accessing' }
SpkColumnsPresenter >> layout [
	^ columnLayout ifNil: [ 
		  columnLayout := SpkAccordianLayout newHorizontal ]
]
