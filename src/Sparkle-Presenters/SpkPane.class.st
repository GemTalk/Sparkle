"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpkPresenterWithHeader',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'specs' }
SpkPane class >> defaultSpec [
	^ SpBoxLayout newVertical
		  add: self headerLayout height: self headerHeight;
		  yourself
]

{ #category : 'accessing colors' }
SpkPane class >> headerColor [
	self subclassResponsibility
]

{ #category : 'values' }
SpkPane class >> headerHeight [

	^ 24
]

{ #category : 'layout' }
SpkPane class >> headerLayout [

	^ SpkBoxLayout newHorizontal
		  color: self headerColor;
		  add: #paneIcon width: 16;
		  add: (SpkBoxLayout newHorizontal
				   hAlignCenter;
				   vAlignEnd;
				   add: #paneLabel withConstraints: [ :constraints | 
					   constraints
						   fill: false;
						   yourself ];
				   yourself);
		  add: #paneMenuButton width: 24;
		  add: #paneCloseButton width: 24;
		  yourself
]

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
SpkPane >> menuActions [

	self subclassResponsibility
]

{ #category : 'menu messages' }
SpkPane >> redo [

	^ model redo
]

{ #category : 'menu messages' }
SpkPane >> undo [

	^ model undo
]
