"
A pane that displays one frame of a debugger stack. 
Features
- Inspection of local variables (parameters, temporaries, evaluation stack)
- Source code with current position highlighted
- Controls for stepping relative to this frame
"
Class {
	#name : 'SpkDebuggerFramePane',
	#superclass : 'SpkPane',
	#traits : 'SpkTTwizzledList + SpkTHeader',
	#classTraits : 'SpkTTwizzledList classTrait + SpkTHeader classTrait',
	#instVars : [
		'sourceLayout',
		'controlsLayout',
		'stepOverButton',
		'stepThroughButton',
		'stepIntoButton',
		'restartButton',
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

{ #category : 'initialization' }
SpkDebuggerFramePane >> connectPresenters [

	super connectPresenters.
	self header menu: self menuCommandGroup asMenuPresenter.
	model
		when: SpkPaneServiceAnnouncement
		send: #receivePaneServiceAnnouncement:
		to: self
]

{ #category : 'accessing' }
SpkDebuggerFramePane >> controlButtonNamed: buttonName
icon: iconBaseName
action: anEvaluable [

	^self newIconButton
		color: Color transparent;
		enabledIcon: (self iconNamed: (iconBaseName, '28') asSymbol);
		disabledIcon: (self iconNamed: (iconBaseName, 'Disabled28') asSymbol);
		help: buttonName;
		action: anEvaluable;
		enablementCondition: [:aBoolean | model canStep & aBoolean];
		yourself
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

	stepIntoButton := self controlButtonNamed: 'Step into' 
		icon: #stepInto
		action: [ self stepInto ].
			
	stepThroughButton := self controlButtonNamed: 'Step through blocks'
		icon: #stepThrough
		action: [ self stepThrough ].

	stepOverButton := self controlButtonNamed: 'Step over'
		icon: #stepOver
		action: [ self stepOver ].

	restartButton := self controlButtonNamed: 'Restart frame'
		icon: #restart
		action: [ self restart ].

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
			width: 28 ];
		add: restartButton withConstraints: [ :c | 
		c
			height: 35;
			width: 28 ]
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeListColumns [

	self list
		addColumn: (SpStringTableColumn evaluated: [:item | item model name]);
		addColumn: (SpStringTableColumn evaluated: [:item | item model description])
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeLocalVariableList [

	self initializeTwizzledList.
	self twizzledList
		showSubPresenter: false;
		twizzleHelp: 'Show or hide the local variable list'
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializePresenters [

	super initializePresenters.
	self
		initializeHeader;
		initializeLocalVariableList;
		addSeparator;
		initializeSourceLayout;
		defer: [ "Decoration cannot be added until the code adapter is built (issue 49)" 
			self refreshFromService ]
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
	inspectorService := field model
		                    inspectFieldIn: self explorerService
		                    forRequest: field.
	"If nil, a server round trip is required and the inspector pane 
	will be created by announcement from the service."
	inspectorService ifNil: [ self disableAll ] ifNotNil: [ 
		field openLinkedPane: inspectorService.
		self refreshList ]
]

{ #category : 'as yet unclassified' }
SpkDebuggerFramePane >> listLabelString [

	^ self listItemServices size printString , ' local variables'
]

{ #category : 'accessing' }
SpkDebuggerFramePane >> menuCommandClasses [

	^{SpkStepIntoCommand. SpkStepThroughCommand. SpkStepOverCommand. SpkRestartFrameCommand.}
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> refreshFromService [

	self
		refreshTwizzledList;
		refreshSourcePane
]

{ #category : 'as yet unclassified' }
SpkDebuggerFramePane >> refreshSourcePane [

	sourcePresenter text: self sourceText.
	self addSourcePositionDecoration
]

{ #category : 'actions' }
SpkDebuggerFramePane >> restart [

	self disableAll.
	model restart
]

{ #category : 'printing' }
SpkDebuggerFramePane >> sourceText [

	^ model source
]

{ #category : 'actions' }
SpkDebuggerFramePane >> stepInto [

	self disableAll.
	model stepInto
]

{ #category : 'actions' }
SpkDebuggerFramePane >> stepOver [

	self disableAll.
	model stepOver
]

{ #category : 'actions' }
SpkDebuggerFramePane >> stepThrough [

	self disableAll.
	model stepThrough
]
