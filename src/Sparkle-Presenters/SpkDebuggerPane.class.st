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
SpkDebuggerPane >> initializeDescription [

	description := self instantiate: SpkTwizzledString.
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
SpkDebuggerPane >> updateDescription [

	description
		labelString: model exceptionDescription;
		bodyString: model exceptionDescription
]

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> updateInspectors [

	model updateInspectors
]
