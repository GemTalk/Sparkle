Class {
	#name : 'SpkCodePresenter',
	#superclass : 'SpCodePresenter',
	#instVars : [
		'#hasUnacceptedEdits => ObservableSlot'
	],
	#category : 'Sparkle-Spextensions-Presenters',
	#package : 'Sparkle-Spextensions',
	#tag : 'Presenters'
}

{ #category : 'specs' }
SpkCodePresenter class >> adapterName [
	^ #SpkCodeAdapter
]

{ #category : 'commands' }
SpkCodePresenter class >> buildCommandsGroupWith: presenter forRoot: aCmCommandsGroup [

	"Don't want any of the standard keybindings, so do nothing here."

	
]

{ #category : 'commands' }
SpkCodePresenter class >> codeAcceptCommandsGroupWith: aPresenter [

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Accept commands') asSpecGroup
		                description: 'Accept or cancel changes.';
		                beDisplayedAsGroup;
		                yourself.

	commandGroup register:
		(SpkAcceptChangesCommand forSpecContext: aPresenter).
	commandGroup register: 
		(SpkDebugCommand forSpecContext: aPresenter).
   "commandGroup register:
		(SpkCancelChangesCommand forSpecContext: aPresenter)."

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

{ #category : 'acccessing' }
SpkCodePresenter >> hasUnacceptedEdits [
	"Return if the text zone has unaccepted edits (orange corner)"

	^ hasUnacceptedEdits
]

{ #category : 'acccessing' }
SpkCodePresenter >> hasUnacceptedEdits: aBoolean [
	"Return if the text zone has unaccepted edits (orange corner)"

	hasUnacceptedEdits := aBoolean
]

{ #category : 'initialization' }
SpkCodePresenter >> initialize [

	super initialize.
	hasUnacceptedEdits := false
]

{ #category : 'initialization' }
SpkCodePresenter >> registerEvents [

	super registerEvents.
	self
		property: #hasUnacceptedEdits
		whenChangedDo: [ :bool |
		self changed: #setHasUnacceptedEdits: with: { bool } ]
]
