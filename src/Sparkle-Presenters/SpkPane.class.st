"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.


**Instance Variables**
* coordinate	<SpkPaneCoordinate> Determines the position of this pane in its window, relative to other panes.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpkPresenterWithHeader',
	#instVars : [
		'coordinate'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'commands' }
SpkPane class >> sourceCodeCommandsGroupWith: aPresenter [

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
SpkPane class >> undoRedoCommandsGroupWith: aPresenter [

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

{ #category : 'accessing' }
SpkPane >> coordinate [
	^ coordinate
]

{ #category : 'accessing' }
SpkPane >> coordinate: anObject [
	coordinate := anObject
]

{ #category : 'actions' }
SpkPane >> disableAll [

	"Disable all widgets in this pane so that we cannot get any GUI events while
	awaiting an answer from the server."

	self enabled: false
]

{ #category : 'initialization' }
SpkPane >> initialize [

	super initialize.
	coordinate := SpkPaneCoordinate new
]

{ #category : 'accessing' }
SpkPane >> menuActions [

	self subclassResponsibility
]

{ #category : 'actions' }
SpkPane >> reEnableAll [

	"Enable widgets in this pane after receiving a reply from the server.
At the moment, this does enable all widgets in the pane.
At some point, we will need to do something more sophisticated to determine whether
an item really should be enabled."

	self enabled: true
]

{ #category : 'menu messages' }
SpkPane >> redo [

	^ model redo
]

{ #category : 'menu messages' }
SpkPane >> undo [

	^ model undo
]
