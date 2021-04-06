"
A pane that displays one frame of a debugger stack. 
Features
- Inspection of local variables (parameters, temporaries, evaluation stack)
- Source code with current position highlighted
- Controls for stepping relative to this frame
"
Class {
	#name : 'SpkDebuggerFramePane',
	#superclass : 'SpkPaneWithTwizzledList',
	#instVars : [
		'sourceLayout',
		'controlsLayout',
		'stepOverButton',
		'stepThroughButton',
		'stepIntoButton',
		'sourcePresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'adding' }
SpkDebuggerFramePane >> addSourcePositionDecoration [

	sourcePresenter
		removeAllTextSegmentDecorations;
		addTextSegmentDecoration: (SpTextPresenterDecorator new
				 highlightColor: (Color orange alpha: 0.5);
				 underlineColor: Color transparent;
				 interval:
					 (model currentStartPosition to: model currentEndPosition + 1);
				 yourself)
]

{ #category : 'tests - header' }
SpkDebuggerFramePane >> headerClass [

	^ SpkDebuggerFramePaneHeader
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeControlsLayout [

	controlsLayout := SpkBoxLayout newVertical
		                  color: (Color gray: 0.18);
		                  yourself.

	sourceLayout
		add: controlsLayout
		withConstraints: [ :c | c width: 35 ].
		
	stepIntoButton := self newIconButton
		                  color: Color transparent;
		                  icon: (self iconNamed: #stepInto28);
		                  help: 'Step into';
		                  action: [ self stepInto ];
		                  yourself.

	stepThroughButton := self newIconButton
		                  color: Color transparent;
		                  icon: (self iconNamed: #stepThrough28);
		                  help: 'Step through blocks';
		                  action: [ self stepThrough ];
		                  yourself.


	stepOverButton := self newIconButton
		                  color: Color transparent;
		                  icon: (self iconNamed: #stepOver28);
		                  help: 'Step over';
		                  action: [ self stepOver ];
		                  yourself.

	controlsLayout
		add: SpkBoxLayout newHorizontal
		withConstraints: [ :c | c height: 8 ];
		add: stepIntoButton withConstraints: [ :c | 
			c
				height: 35;
				width: 28 ];
		add: stepThroughButton withConstraints: [ :c | 
			c
				height: 35;
				width: 28 ];
		add: stepOverButton withConstraints: [ :c | 
			c
				height: 35;
				width: 28 ]

]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeListColumns [

	list
		addColumn: (SpStringTableColumn evaluated: #name);
		addColumn: (SpStringTableColumn evaluated: #description)
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeLocalVariableList [

	self initializeTwizzledList.
	twizzledList
		showSubPresenter: false;
		twizzleHelp: 'Show or hide the local variable list'
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializePresenters [

	super initializePresenters.
	self
		initializeLocalVariableList;
		initializeSourceLayout;
		defer: [ "Decoration cannot be added until the code adapter is built (issue 49)" 
			self updateFromModel ]
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeSourceLayout [

	sourceLayout := SpkBoxLayout newHorizontal.
	self layout add: sourceLayout.

	self
		initializeControlsLayout;
		initializeSourcePresenter
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeSourcePresenter [

	sourcePresenter := self newCode
		                   beNotEditable;
		                   withoutLineNumbers;
		                   yourself.
	sourceLayout add: sourcePresenter
]

{ #category : 'actions' }
SpkDebuggerFramePane >> itemSelected: anAnnouncement [

	"This announcement comes from the UI, not a service, so does not need to be deferred."

	| field inspectorService |
	field := anAnnouncement item.
	inspectorService := field model inspectFieldForRequest: field.
	"If nil, a server round trip is required and the inspector pane 
	will be created by announcement from the service."
	inspectorService
		ifNil: [ self disableAll ]
		ifNotNil: [ self openLinkedPane: inspectorService forItem: field ]
]

{ #category : 'as yet unclassified' }
SpkDebuggerFramePane >> listLabelString [

	^ self listItemServices size printString , ' local variables'
]

{ #category : 'as yet unclassified' }
SpkDebuggerFramePane >> refreshSourcePane [

	sourcePresenter text: self sourceText.
	self addSourcePositionDecoration
]

{ #category : 'printing' }
SpkDebuggerFramePane >> sourceText [

	^ model source
]

{ #category : 'actions' }
SpkDebuggerFramePane >> stepInto [
		self disableAll.
		self flag: 'This requestId may be incorrect or unused'.
		model stepIntoFor: linkedFrom
]

{ #category : 'actions' }
SpkDebuggerFramePane >> stepOver [ 
		self disableAll.
		self flag: 'This requestId may be incorrect or unused'.
		model stepOverFor: linkedFrom
]

{ #category : 'actions' }
SpkDebuggerFramePane >> stepThrough [
		self disableAll.
		self flag: 'This requestId may be incorrect or unused'.
		model stepThroughFor: linkedFrom
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> updateFromModel [

	self
		refreshTwizzledList;
		refreshSourcePane;
		reEnableAll
]

{ #category : 'as yet unclassified' }
SpkDebuggerFramePane >> updateServices [

	"Can be sent in any thread."

	model updateServices
]
