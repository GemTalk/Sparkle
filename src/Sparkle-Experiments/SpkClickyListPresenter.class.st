Class {
	#name : 'SpkClickyListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'model',
		'listPane',
		'window'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'specs' }
SpkClickyListPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #listPane;
		yourself
]

{ #category : 'model interaction' }
SpkClickyListPresenter >> hookToModel [
	model addDependent: self.
	listPane items: model items
]

{ #category : 'initialization' }
SpkClickyListPresenter >> initializePresenters [
	listPane := self newList.
	listPane whenSelectionChangedDo: [ :a | "self halt" ].
	self focusOrder add: listPane.
	self hookToModel
]

{ #category : 'initialization' }
SpkClickyListPresenter >> initializeWindow: aWindowPresenter [
	window := aWindowPresenter.
	aWindowPresenter
		title: 'ClickyList';
		aboutText: 'Testing list multi-selection'
]

{ #category : 'accessing' }
SpkClickyListPresenter >> listPane [
	^ listPane
]

{ #category : 'accessing' }
SpkClickyListPresenter >> listPane: anObject [
	listPane := anObject
]

{ #category : 'widgets' }
SpkClickyListPresenter >> newList [
	^ self instantiate: SpkMultipleSelectionListPresenter
]

{ #category : 'accessing model' }
SpkClickyListPresenter >> setModelBeforeInitialization: aDomainObject [
	model := aDomainObject
]
