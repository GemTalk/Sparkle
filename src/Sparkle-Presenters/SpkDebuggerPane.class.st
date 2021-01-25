Class {
	#name : 'SpkDebuggerPane',
	#superclass : 'SpkPane',
	#instVars : [
		'topLayout',
		'twizzle',
		'description',
		'fullDescriptionIsShown',
		'fullDescription',
		'frameList',
		'frameListModel'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> frameSelected: anAnnouncement [

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

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> initializeFrameList [

	self initializeFrameListModel.
	frameList := self newTable.
	frameList
		whenSelectionChangedDo: [ :selectionMode | 
			frameListModel selectedIndexes: selectionMode selectedIndexes ];
		items: frameListModel;
		addColumn: (SpStringTableColumn evaluated: #description);
		addColumn: ((SpImageTableColumn evaluated: [ :frame | 
					  frame hasLinkedPane
						  ifTrue: [ self iconNamed: #hidePane16 ]
						  ifFalse: [ self iconNamed: #showPane16 ] ])
				 width: 25;
				 yourself);
		hideColumnHeaders.
	self layout add: frameList
]

{ #category : 'initialization' }
SpkDebuggerPane >> initializeFrameListModel [

	| frames |
	frameListModel := SpkMultiSelectList new.
	frames := model frames reverse collect: [ :each | 
		          (SpkMultiSelectListItem for: each)
			          list: frameListModel;
			          yourself ].
	frameListModel
		addAll: frames;
		when: SpkItemSelected send: #frameSelected: to: self;
		when: SpkItemDeselected send: #frameDeselected: to: self
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

{ #category : 'accessing' }
SpkDebuggerPane >> linkedPanes [

	^ frameListModel linkedPanes
]

{ #category : 'accessing' }
SpkDebuggerPane >> menuActions [

	
]

{ #category : 'actions' }
SpkDebuggerPane >> openLinkedPane: aPaneService forItem: item [

	" Create and open an inspector pane in the next column.
	item is an InspectorField or an evaluator."

	super openLinkedPane: aPaneService forItem: item.
	self refreshFrameList "Change linking arrow."
]

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> refreshFrameList [

	frameList refresh
]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
SpkDebuggerPane >> updateExceptionDescriptionVisibility [

	fullDescriptionIsShown
		ifTrue: [ self layout add: fullDescription after: topLayout ]
		ifFalse: [ self layout remove: fullDescription ]
]

{ #category : 'updating' }
SpkDebuggerPane >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	frameList selectIndexes: frameListModel selectedIndexes
]

{ #category : 'actions' }
SpkDebuggerPane >> updateTwizzleIcon [

	twizzle icon: self twizzleIcon
]
