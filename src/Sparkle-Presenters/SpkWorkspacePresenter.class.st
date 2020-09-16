Class {
	#name : 'SpkWorkspacePresenter',
	#superclass : 'SpkColumnsPresenter',
	#instVars : [
		'codePresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'specs' }
SpkWorkspacePresenter class >> defaultSpec [
	"This method only here to quiet browser linting. Should never be sent to this class.
	See instance-side #layout."

	self error: '#defaultSpec sent when not expected'
]

{ #category : 'TOREMOVE' }
SpkWorkspacePresenter >> aboutTitle [
	"Unlike other window properties, at the time of this writing this property cannot be set in 	#initializeWindow. If that changes in the future this should be moved."

	^ 'the Sparkle Object Explorer'
]

{ #category : 'adding' }
SpkWorkspacePresenter >> addEvaluator [

	| column evaluatorPane |
	self flag: #TODO.
	"Evaluators don't really belong to the workspace, they belong to an individual inspector,
	so should be sent to an inspectorPresenter (which does not currently exist)"
	column := self columnAt: 1.
	evaluatorPane := SpkEvaluatorPane
		                 owner: self
		                 on: SpkWorkspaceServiceClient new.
	"New evaluator is always added right before the add evaluator button, which is always last."
	column add: evaluatorPane beforeIndex: column layout children size
]

{ #category : 'adding' }
SpkWorkspacePresenter >> addInitialEvaluator [

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
SpkWorkspacePresenter >> initializePresenters [
	self
		addColumn;
		addColumn;
		addInitialEvaluator
]

{ #category : 'initialization' }
SpkWorkspacePresenter >> newAddEvaluatorButton [

	^ self newButton
		  icon: (self iconNamed: #addEvaluator24);
		  help: 'Add Evaluator';
		  action: [ self addEvaluator ];
		  yourself
]
