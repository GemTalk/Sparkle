Class {
	#name : 'SpkDebuggerPane',
	#superclass : 'SpkPaneWithList',
	#instVars : [
		'topLayout',
		'twizzle',
		'description',
		'fullDescriptionIsShown',
		'fullDescription'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

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
		initializeFrameList
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

{ #category : 'accessing' }
SpkDebuggerPane >> linkedPanes [

	^ self panesLinkedToListItems
]

{ #category : 'accessing' }
SpkDebuggerPane >> listItemModels [

	^ model frames reverse
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
