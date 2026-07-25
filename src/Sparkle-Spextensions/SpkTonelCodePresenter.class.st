Class {
	#name : 'SpkTonelCodePresenter',
	#superclass : 'SpkCodePresenter',
	#category : 'Sparkle-Spextensions-Presenters',
	#package : 'Sparkle-Spextensions',
	#tag : 'Presenters'
}

{ #category : 'commands' }
SpkTonelCodePresenter class >> codeAcceptCommandsGroupWith: aPresenter [

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Accept commands') asSpecGroup
		                description: 'Accept or cancel changes.';
		                beDisplayedAsGroup;
		                yourself.

	commandGroup register:
		(SpkAcceptTonelChangesCommand forSpecContext: aPresenter).
	commandGroup register:
		(SpkCancelChangesCommand forSpecContext: aPresenter).

	^ commandGroup
]
