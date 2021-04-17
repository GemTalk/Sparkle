Class {
	#name : 'SpkDebuggerPane',
	#superclass : 'SpkPaneWithList',
	#instVars : [
		'description',
		'processControlLayout',
		'proceedButton',
		'terminateButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'events' }
SpkDebuggerPane >> closeRequestedLocally [

	"Terminate process then close UI.
	Pane presenter close comes via announcement once the server gets done terminating."

	self disableAll.
	model terminate
]

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> deselectExitedFrames [

	"Deselect any selected frames that are no longer on the stack.
	We know which these are by identity of the FrameDescriptionService."

	| oldFrameItems newFrames |
	oldFrameItems := listModel items reverse. "Compare from the bottom of the stack."
	newFrames := model frames.
	1 to: (newFrames size min: oldFrameItems size) do: [ :index | 
		| oldFrameItem oldFrame newFrame |
		oldFrameItem := oldFrameItems at: index.
		oldFrame := oldFrameItem model.
		newFrame := newFrames at: index.
		oldFrame == newFrame ifFalse: [ 
			listModel deselectItem: oldFrameItem ] ]
]

{ #category : 'private' }
SpkDebuggerPane >> deselectInvalidFrames [

	"I have frames, which are ListItems.
	Each has a model which is a DebuggerFrameDescriptionService.
	
	My model is a DebuggerService.
	It has frames which are also debuggerFrameServiceDescriptionServices
	
	The lists are in the reverse order from each other -- match from bottom of the stack upward.
	
	The FrameServiceDescriptionServices that do not match (by identity) are not valid.
	
	Some of my DebuggerFrameDescriptionServices will have linkedServices.
	I think I can ignore this... they should have all been updated by RSR from the server.
	
	Some of my ListItems may have a linkedPane. Those for invalid frames should be told to close.
	Those for valid frames should be told to update from model.
	 "

	self
		deselectOffTheTopFrames;
		deselectExitedFrames
]

{ #category : 'private' }
SpkDebuggerPane >> deselectOffTheTopFrames [

	| newNumberOfFrames |
	newNumberOfFrames := model frames size.
	listModel deselectItemsThroughIndex: listModel size - newNumberOfFrames
]

{ #category : 'accessing' }
SpkDebuggerPane >> headerClass [

	^ SpkDebuggerPaneHeader
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeDescription [

	description := self instantiate: SpkTwizzledString.
	description twizzleHelp:
		'Show or hide the full description of the exception'.
	self updateDescription
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeFrameList [

	self initializeList.
	self layout add: list
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeListColumns [

	list addColumn: (SpStringTableColumn evaluated: #description)
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializePresenters [

	super initializePresenters.
	self
		initializeDescription;
		initializeProcessControls;
		initializeFrameList
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeProcessControls [

	processControlLayout := SpkBoxLayout newHorizontal
		                        placeWidgetsAtCenter;
		                        color: Color veryVeryDarkGray;
		                        yourself.
	self layout
		add: processControlLayout
		withConstraints: [ :c | c height: 35 ].

	proceedButton := self newIconButton
		                 color: Color transparent;
		                 icon: (self iconNamed: #proceed28);
		                 help: 'Proceed';
		                 action: [ self proceed ];
		                 yourself.

	terminateButton := self newIconButton
		                   color: Color transparent;
		                   icon: (self iconNamed: #terminate28);
		                   help: 'Terminate';
		                   action: [ self closeRequestedLocally ];
		                   yourself.

	processControlLayout
		add: proceedButton withConstraints: [ :c | 
			c
				height: 28;
				width: 28 ];
		add: SpkBoxLayout newVertical withConstraints: [ :c | c width: 25 ];
		add: terminateButton withConstraints: [ :c | 
		c
			height: 28;
			width: 28 ]
]

{ #category : 'actions' }
SpkDebuggerPane >> itemSelected: anAnnouncement [

	"This announcement comes from the UI, not a service, so does not need to be deferred."

	| frame frameService |
	frame := anAnnouncement item.
	frameService := frame model frameServiceForRequest: frame.
	"If nil, a server round trip is required and the inspector pane 
	will be created by announcement from the service."
	frameService
		ifNil: [ self disableAll ]
		ifNotNil: [ self openLinkedPane: frameService forItem: frame ]
]

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> linkedFramePanes [
	^ listModel linkedPanes
]

{ #category : 'menu' }
SpkDebuggerPane >> proceed [

	self disableAll.
	model proceed
]

{ #category : 'action' }
SpkDebuggerPane >> replace [

	"I'm done being a debugger, usually because my process has completed or been terminated.
	Replace myself with a new pane."

	linkedFrom ifNil: [ 
		self flag:
			'Should replace self with new independent pane with my coordinate.'.
		^ self error: 'Independent debugger panes not yet fully supported.' ].
	self openLinkedPane: model replacementService forItem: linkedFrom
]

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> selectTopFrame [

	"If the top frame is not selected, select it."

	listModel ensureFirstItemSelected.
	self updateSelection
]

{ #category : 'initialization' }
SpkDebuggerPane >> updateDebuggerFromModel [

	"Must be sent in the UI thread"

	"We've been told that execution has happened,
	but we're still in the debugger. Update to show the new state."

	self
		updateDescription;
		updateFrameList;
		reEnableAll
]

{ #category : 'private' }
SpkDebuggerPane >> updateDescription [

	description
		labelString: model exceptionDescription;
		bodyString: model exceptionDescription
]

{ #category : 'private' }
SpkDebuggerPane >> updateFrameList [

	| listCount |
	listCount := listModel size.
	self
		deselectInvalidFrames;
		refreshListModel;
		refreshList;
		selectTopFrame.
	listCount ~= listModel size
		ifTrue: [ self updateLinkedPaneCoordinates ]
]

{ #category : 'initialization' }
SpkDebuggerPane >> updateFromModel [

	"Must be sent in the UI thread"

	"We've been told that execution has happened,
	and we don't know whether we're still in the debugger."

	model isValid
		ifTrue: [ self updateDebuggerFromModel ]
		ifFalse: [ self replace ]
]

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> updateLinkedFramePanes [

	self linkedFramePanes do: [ :pane | pane updateFromModel ]
]

{ #category : 'private' }
SpkDebuggerPane >> updateServices [

	"Can be sent in any thread."

	model updateServices
]
