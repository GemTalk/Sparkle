Class {
	#name : 'SpkMultipleSelectionTablePresenter',
	#superclass : 'SpTablePresenter',
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkMultipleSelectionTablePresenter class >> adapterName [
	^ #SpkTableAdapter
]

{ #category : 'initialization' }
SpkMultipleSelectionTablePresenter >> initialize [

	super initialize.
	self beMultipleSelection
]

{ #category : 'accessing' }
SpkMultipleSelectionTablePresenter >> selectionColor [ 
	^ Color h: 220 s: 0.5 v: 0.5
]
