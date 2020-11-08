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
