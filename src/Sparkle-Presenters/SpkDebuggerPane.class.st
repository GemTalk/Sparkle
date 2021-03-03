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

	"Terminate process then close UI."

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

	description := self newLabel
		               label: model exceptionDescription;
		               yourself.
	topLayout add: description withConstraints: [ :c | c fill: false ]
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeExceptionDescription [

	fullDescriptionIsShown := false.
	self
		initializeTop;
		initializeFullDescription
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeFrameList [

	self initializeList.
	self layout add: self list
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeFullDescription [

	"Dynamically added to or removed from my layout upon twizzle click."

	fullDescription := self newText.
	fullDescription
		beNotEditable;
		text: model exceptionDescription
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeListColumns [

	self list addColumn: (SpStringTableColumn evaluated: #description)
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

	topLayout := SpkBoxLayout newHorizontal.
	self layout add: topLayout withConstraints: [ :c | c height: 25 ].
	self
		initializeTwizzle;
		initializeDescription
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeTwizzle [

	twizzle := self newIconButton
		           icon: self twizzleIcon;
		           help: 'Show or hide the full exception description';
		           action: [ self toggleExceptionDescription ];
		           yourself.
	topLayout add: twizzle withConstraints: [ :c | 
		c
			fill: false;
			width: 20;
			height: 20 ]
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

{ #category : 'actions' }
SpkDebuggerPane >> toggleExceptionDescription [

	fullDescriptionIsShown := fullDescriptionIsShown not.
	self
		updateTwizzleIcon;
		updateExceptionDescriptionVisibility
]

{ #category : 'initialization' }
SpkDebuggerPane >> twizzleIcon [

	^ fullDescriptionIsShown
		  ifTrue: [ self iconNamed: #treeExpanded ]
		  ifFalse: [ self iconNamed: #treeUnexpanded ]
]

{ #category : 'actions' }
SpkDebuggerPane >> updateExceptionDescriptionVisibility [

	fullDescriptionIsShown
		ifTrue: [ self layout add: fullDescription after: topLayout ]
		ifFalse: [ self layout remove: fullDescription ]
]

{ #category : 'actions' }
SpkDebuggerPane >> updateTwizzleIcon [

	twizzle icon: self twizzleIcon
]
