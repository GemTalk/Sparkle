"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpkPresenter',
	#instVars : [
		'model',
		'paneIcon',
		'paneLabel',
		'paneMenu',
		'paneMenuButton',
		'paneCloseButton'
	],
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

{ #category : 'events' }
SpkPane >> closeRequestedLocally [

	self notYetImplemented: 'Pane closing'
]

{ #category : 'initialization' }
SpkPane >> connectPresenters [

	super connectPresenters.
	paneMenuButton menu: self paneMenu
]

{ #category : 'initialization' }
SpkPane >> initializePresenters [

	paneIcon := self newImage
		            image: (self iconNamed: #glamorousGrayCircleEmpty);
		            yourself.
	paneLabel := self newLabel.
	paneMenuButton := self newMenuButton
		                  color: Color transparent;
		                  icon: (self iconNamed: #hamburgerWhite16);
		                  yourself.
	paneCloseButton := self newButton
		                   color: Color transparent;
		                   icon: (self iconNamed: #glamorousClose);
		                   help: 'Close the pane';
		                   action: [ self closeRequestedLocally ];
		                   yourself
]

{ #category : 'accessing' }
SpkPane >> menuActions [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkPane >> model [
	^ model
]

{ #category : 'accessing' }
SpkPane >> paneCloseButton [
	^ paneCloseButton
]

{ #category : 'accessing' }
SpkPane >> paneCloseButton: anObject [
	paneCloseButton := anObject
]

{ #category : 'accessing' }
SpkPane >> paneIcon [
	^ paneIcon
]

{ #category : 'accessing' }
SpkPane >> paneIcon: anObject [
	paneIcon := anObject
]

{ #category : 'accessing' }
SpkPane >> paneLabel [
	^ paneLabel
]

{ #category : 'accessing' }
SpkPane >> paneLabel: anObject [
	paneLabel := anObject
]

{ #category : 'accessing' }
SpkPane >> paneMenu [

	^ paneMenu ifNil: [ paneMenu := self menuActions asMenuPresenter ]
]

{ #category : 'accessing' }
SpkPane >> paneMenu: anObject [
	paneMenu := anObject
]

{ #category : 'accessing' }
SpkPane >> paneMenuButton [
	^ paneMenuButton
]

{ #category : 'accessing' }
SpkPane >> paneMenuButton: anObject [
	paneMenuButton := anObject
]

{ #category : 'menu messages' }
SpkPane >> redo [

	^ model redo
]

{ #category : 'accessing' }
SpkPane >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'menu messages' }
SpkPane >> undo [

	^ model undo
]
