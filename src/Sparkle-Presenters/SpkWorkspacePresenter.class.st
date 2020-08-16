Class {
	#name : 'SpkWorkspacePresenter',
	#superclass : 'SpkColumnsPresenter',
	#instVars : [
		'codePresenter'
	],
	#category : 'Sparkle-Presenters'
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
SpkWorkspacePresenter >> addInitialEvaluator [

	| leftColumn evaluatorPane addEvaluatorButton |
	leftColumn := self columnAt: 1.
	evaluatorPane := self newCode.
	evaluatorPane owner: self.
	addEvaluatorButton := self newAddEvaluatorButton.
	addEvaluatorButton owner: self.
	"The column is empty at this point."
	leftColumn
		add: addEvaluatorButton withConstraints: [ :constraints | 
			constraints
				height: 40;
				yourself ]
		beforeIndex: 1;
		add: evaluatorPane beforeIndex: 1
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
		  yourself
]

{ #category : 'instance creation' }
SpkWorkspacePresenter >> newCode [
	^ self instantiate: SpkEvaluatorPane
]
