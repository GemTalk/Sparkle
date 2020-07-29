Class {
	#name : 'SpkWorkspacePresenter',
	#superclass : 'SpkColumnsPresenter',
	#category : 'Sparkle-Presenters'
}

{ #category : 'specs' }
SpkWorkspacePresenter class >> defaultSpec [
	"This method only here to quiet browser linting. Should never be sent to this class.
	See instance-side #layout."

	self error: '#defaultSpec sent when not expected'
]

{ #category : 'TOREMOVE' }
SpkWorkspacePresenter >> aboutText [
	^ 'The Sparkle object explorer is part of the Pharo IDE for GemStone, 
a set of tools for developing GemStone code via a remote connection from Pharo.

Enter code in the leftmost column. Accept to evaluate the code and inspect the result.'
]

{ #category : 'TOREMOVE' }
SpkWorkspacePresenter >> aboutTitle [
	^ 'the Sparkle Object Explorer'
]

{ #category : 'TOREMOVE' }
SpkWorkspacePresenter >> initialExtent [
	^ 500 @ 500
]

{ #category : 'initialization' }
SpkWorkspacePresenter >> initializePresenters [
	self
		addColumn;
		addColumn;
		addInitialEvaluator
]

{ #category : 'initialization' }
SpkWorkspacePresenter >> title [
	^ 'Sparkle Object Explorer'
]
