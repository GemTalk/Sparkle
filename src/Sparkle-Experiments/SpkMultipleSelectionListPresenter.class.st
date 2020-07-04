"
A multi-select list widget with click-on-click-off behavior (as opposed to cmd-click to mult-select).

"
Class {
	#name : 'SpkMultipleSelectionListPresenter',
	#superclass : 'SpListPresenter',
	#category : 'Sparkle-Experiments'
}

{ #category : 'specs' }
SpkMultipleSelectionListPresenter class >> adapterName [
	^ #SpkListAdapter
]

{ #category : 'initialization' }
SpkMultipleSelectionListPresenter >> initialize [
	super initialize.
	self beMultipleSelection
]
