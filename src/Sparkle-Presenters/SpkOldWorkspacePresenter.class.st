Class {
	#name : 'SpkOldWorkspacePresenter',
	#superclass : 'SpkWindowWithColumns',
	#instVars : [
		'codePresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'specs' }
SpkOldWorkspacePresenter class >> defaultSpec [
	"This method only here to quiet browser linting. Should never be sent to this class.
	See instance-side #layout."

	self error: '#defaultSpec sent when not expected'
]

{ #category : 'constants' }
SpkOldWorkspacePresenter >> aboutTitle [
	"Unlike other window properties, at the time of this writing this property cannot be set in 	#initializeWindow. If that changes in the future this should be moved."

	^ 'the Sparkle Object Explorer'
]

{ #category : 'adding' }
SpkOldWorkspacePresenter >> addEvaluator [

	| column evaluatorPane |
	self flag: #TODO.
	"Evaluators don't really belong to the workspace, they belong to an individual inspector,
	so should be sent to an inspectorPresenter (which does not currently exist)"
	column := self columnAt: 1.
	evaluatorPane := SpkEvaluator
		                 owner: self
		                 on: SpkEvaluatorServiceClient new.
	"New evaluator is always added right before the add evaluator button, which is always last."
	column add: evaluatorPane beforeIndex: column layout children size
]

{ #category : 'adding' }
SpkOldWorkspacePresenter >> addInitialEvaluator [

	| column addEvaluatorButton |
	column := self columnAt: 1.
	addEvaluatorButton := self newAddEvaluatorButton.
	"The column is empty at this point."
	column
		add: addEvaluatorButton
		withConstraints: [ :constraints | 
			constraints
				height: 40;
				yourself ]
		beforeIndex: 1.
	self addEvaluator
]

{ #category : 'initialization' }
SpkOldWorkspacePresenter >> initializePresenters [
	self
		addColumn;
		addColumn;
		addInitialEvaluator
]

{ #category : 'initialization' }
SpkOldWorkspacePresenter >> newAddEvaluatorButton [

	^ self newButton
		  icon: (self iconNamed: #addEvaluator24);
		  help: 'Add Evaluator';
		  action: [ self addEvaluator ];
		  yourself
]
