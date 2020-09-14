Class {
	#name : 'SpkCodePresenter',
	#superclass : 'SpCodePresenter',
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkCodePresenter class >> adapterName [
	^ #SpkCodeAdapter
]

{ #category : 'commands' }
SpkCodePresenter class >> codeAcceptCommandsGroupWith: aPresenter [

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Accept commands') asSpecGroup
		                description: 'Accept or cancel changes.';
		                beDisplayedAsGroup;
		                yourself.

	aPresenter hasSubmitAction ifTrue: [ 
		commandGroup register:
			(SpkAcceptChangesCommand forSpecContext: aPresenter) ].
	aPresenter hasResetAction ifTrue: [ 
		commandGroup register:
			(SpkCancelChangesCommand forSpecContext: aPresenter) ].

	^ commandGroup
]

{ #category : 'commands' }
SpkCodePresenter class >> textEditionCommandsGroupWith: aPresenter [

	| group |
	group := (CmCommandGroup named: 'Selection edition commands')
		         asSpecGroup.
	group
		description: 'Edit code selection.';
		beDisplayedAsGroup.

	{ 
		SpTextCopyCommand.
		SpTextCutCommand.
		SpTextPasteCommand } do: [ :commandClass | 
		group register: (commandClass forSpecContext: aPresenter) ].

	^ group
]
