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
	| evaluatorPane |
	evaluatorPane := self newCode.
	evaluatorPane owner: self.
	(self columnAt: 1) add: evaluatorPane beforeIndex: 1 "The column is empty at this point, so 1 is the only possible index to be before."
]

{ #category : 'initialization' }
SpkWorkspacePresenter >> initializePresenters [
	self
		addColumn;
		addColumn;
		addInitialEvaluator
]

{ #category : 'instance creation' }
SpkWorkspacePresenter >> newCode [
	^ self instantiate: SpkEvaluatorPane
]
