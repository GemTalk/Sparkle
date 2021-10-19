"
I am an abstract class that knows how to display and allow editing of code.
This differs from a plain text editor in several ways:

* Syntax highlighting and checking
* Possibly auto-completing
* Has the marker in the corner if the text has been edited.
"
Class {
	#name : 'SpkCodeSubPane',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'codePresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'commands' }
SpkCodeSubPane class >> sourceCodeCommandsGroupWith: aPresenter [

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Source code commands')
		                asSpecGroup
		                description: 'Format or do it';
		                beDisplayedAsGroup;
		                yourself.

	commandGroup
		register: (SpkFormatCodeCommand forSpecContext: aPresenter);
		register: (SpkDoItCommand forSpecContext: aPresenter);
		register: (SpkDebugItCommand forSpecContext: aPresenter).

	^ commandGroup
]

{ #category : 'commands' }
SpkCodeSubPane class >> undoRedoCommandsGroupWith: aPresenter [

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Undo/redo commands')
		                asSpecGroup
		                description: 'Undo or redo changes.';
		                beDisplayedAsGroup;
		                yourself.

	commandGroup
		register: (SpkUndoCommand forSpecContext: aPresenter);
		register: (SpkRedoCommand forSpecContext: aPresenter).

	^ commandGroup
]

{ #category : 'visiting' }
SpkCodeSubPane >> accept [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkCodeSubPane >> codePresenter [
	^ codePresenter
]

{ #category : 'accessing' }
SpkCodeSubPane >> codePresenter: anObject [
	codePresenter := anObject
]

{ #category : 'initialization' }
SpkCodeSubPane >> connectPresenters [

	super connectPresenters.
	codePresenter overrideContextMenu: true
]

{ #category : 'actions' }
SpkCodeSubPane >> debugIt [

	model debugIt
]

{ #category : 'actions' }
SpkCodeSubPane >> doIt [

	model doIt
]

{ #category : 'actions' }
SpkCodeSubPane >> formatCode [

	model formatCode
]

{ #category : 'testing' }
SpkCodeSubPane >> hasResetAction [

	^ codePresenter hasResetAction
]

{ #category : 'testing' }
SpkCodeSubPane >> hasSubmitAction [

	^ codePresenter hasSubmitAction
]

{ #category : 'initialization' }
SpkCodeSubPane >> initializePresenters [

	super initializePresenters.
	codePresenter := self instantiate: SpkCodePresenter.
	codePresenter
		bindKeyCombination: $s meta
		toAction: [ self accept ]
]

{ #category : 'actions' }
SpkCodeSubPane >> triggerResetAction [

	codePresenter triggerResetAction
]

{ #category : 'actions' }
SpkCodeSubPane >> triggerSubmitAction [

	codePresenter triggerSubmitAction
]
