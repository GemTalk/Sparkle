"
List on the left, panes on the right, each pane corresponding to a selected item from the list.
"
Class {
	#name : 'SpkListAndPanesPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'model',
		'listPane',
		'windowLayout',
		'stackLayout'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'specs' }
SpkListAndPanesPresenter class >> defaultSpec [
	"This method only here to quiet browser linting. Should never be sent to this class.
	See instance-side #layout."

	self error: '#defaultSpec sent when not expected'
]

{ #category : 'adding/removing panes' }
SpkListAndPanesPresenter >> addPaneFor: anItem beforeIndex: anInteger [
	| itemPresenter |
	itemPresenter := anItem asPresenter.
	itemPresenter owner: self.
	stackLayout add: itemPresenter beforeIndex: anInteger
]

{ #category : 'model interaction' }
SpkListAndPanesPresenter >> hookToModel [
	model when: SpkItemSelected send: #itemSelected: to: self.
	model when: SpkItemDeselected send: #itemDeselected: to: self
]

{ #category : 'initialization' }
SpkListAndPanesPresenter >> initializePresenters [
	listPane := SpkClickyListPresenter
		            newApplication: self application
		            owner: self
		            model: model.
	self focusOrder add: listPane.
	self hookToModel
]

{ #category : 'initialization' }
SpkListAndPanesPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Select some things';
		aboutText: 'Testing pane stacking'
]

{ #category : 'selection' }
SpkListAndPanesPresenter >> itemDeselected: announcement [
	"This is sent by the model when a previously selected item becomes unselected."

	self removePaneFor: announcement item atIndex: announcement index
]

{ #category : 'selection' }
SpkListAndPanesPresenter >> itemSelected: announcement [
	"This is sent by the model when a previously unselected item becomes selected."

	self addPaneFor: announcement item beforeIndex: announcement index
]

{ #category : 'accessing' }
SpkListAndPanesPresenter >> layout [
	^ windowLayout ifNil: [ 
		  windowLayout := SpPanedLayout newHorizontal
			                  add: #listPane;
			                  add: self stackLayout;
			                  yourself ]
]

{ #category : 'adding/removing panes' }
SpkListAndPanesPresenter >> removePaneFor: anItem atIndex: anInteger [
	stackLayout removePresenterAtIndex: anInteger
]

{ #category : 'accessing model' }
SpkListAndPanesPresenter >> setModelBeforeInitialization: aDomainObject [
	model := aDomainObject
]

{ #category : 'accessing' }
SpkListAndPanesPresenter >> stackLayout [
	^ stackLayout ifNil: [ 
		  stackLayout := SpkOrderedBoxLayout newVertical
			                 borderWidth: 3;
			                 spacing: 10;
			                 yourself ]
]
