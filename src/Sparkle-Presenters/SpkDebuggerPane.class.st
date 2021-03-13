Class {
	#name : 'SpkDebuggerPane',
	#superclass : 'SpkPaneWithList',
	#instVars : [
		'topLayout',
		'twizzle',
		'description',
		'fullDescriptionIsShown',
		'fullDescription',
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

{ #category : 'initialization' }
SpkDebuggerPane >> connectPresenters [

	super connectPresenters.
	model
		when: SpkTermination
		send: #receiveTerminationAnnouncement:
		to: self
]

{ #category : 'accessing' }
SpkDebuggerPane >> headerClass [

	^ SpkDebuggerPaneHeader
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeExceptionDescription [

	self flag: 'Make this initialize the factored twizzled string'.
	fullDescriptionIsShown := false.
	self
		initializeTop;
		initializeFullDescription
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeFrameList [

	self flag: 'Update for factored twizzled list'.
	self initializeList.
	self layout add: self list
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeFullDescription [

	"Dynamically added to or removed from my layout upon twizzle click."

	self flag: 'Needs update'.
	fullDescription := self newText.
	fullDescription
		beNotEditable;
		text: model exceptionDescription
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeListColumns [

	twizzledList addColumnEvaluated: #description
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializePresenters [

	super initializePresenters.
	self
		initializeExceptionDescription;
		initializeProcessControls;
		initializeFrameList
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeProcessControls [

	processControlLayout := SpkBoxLayout newHorizontal
		                        hAlignCenter;
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

{ #category : 'initialization' }
SpkDebuggerPane >> initializeTop [

	self flag: 'Update for factored twizzle'.
	topLayout := SpkBoxLayout newHorizontal.
	self layout add: topLayout withConstraints: [ :c | c height: 25 ].
	self
		initializeTwizzle;
		initializeDescription
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

{ #category : 'menu' }
SpkDebuggerPane >> proceed [

	self disableAll.
	model proceedFor: linkedFrom
]

{ #category : 'initialization' }
SpkDebuggerPane >> receiveTerminationAnnouncement: anAnnouncement [

	self defer: [ 
		self close.
		self updateInspectors ]
]

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> updateInspectors [

	model updateInspectors
]
