"
List on the left, panes on the right, each pane corresponding to a selected item from the list.
"
Class {
	#name : 'SpkListAndPanesPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'listPane',
		'stackPane'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'specs' }
SpkListAndPanesPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		  add: #listPane;
		  add: #stackPane;
		  yourself
]

{ #category : 'initialization' }
SpkListAndPanesPresenter >> initializePresenters [
	listPane := SpkClickyListPresenter
		            newApplication: self application
		            owner: self
		            model: SpkClickyList withTestContents.
	stackPane := self newComponentList.
	self focusOrder
		add: listPane;
		add: stackPane
]
