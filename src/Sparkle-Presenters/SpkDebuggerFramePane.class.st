Class {
	#name : 'SpkDebuggerFramePane',
	#superclass : 'SpkPaneWithList',
	#instVars : [
		'sourcePresenter',
		'topLayout',
		'twizzle',
		'listIsShown',
		'description'
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
SpkDebuggerFramePane >> initializeDescription [

	description := self newLabel
		               label:
			               model localVariables size printString
			               , ' local variables';
		               yourself.
	topLayout add: description withConstraints: [ :c | c fill: false ]
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeListColumns [

	twizzledList
		addColumnEvaluated: #name;
		addColumnEvaluated: #description
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializePresenters [

	super initializePresenters.
	self
		initializeTop;
		initializeSourcePane;
		defer: [ "Decoration cannot be added until the code adapter is built (issue 49)" 
			self addSourcePositionDecoration ]
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeSourcePane [

	sourcePresenter := self newCode
		                   beNotEditable;
		                   text: self sourceText;
		                   yourself.
	self layout add: sourcePresenter
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeTop [

	listIsShown := false.
	topLayout := SpkBoxLayout newHorizontal.
	self layout add: topLayout withConstraints: [ :c | c height: 25 ].
	self
		initializeTwizzle;
		initializeDescription;
		initializeList;
		updateListVisibility
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeTwizzle [

	twizzle := self newIconButton
		           icon: self twizzleIcon;
		           help: 'Show or hide the local variable list';
		           action: [ self toggleList ];
		           yourself.
	topLayout add: twizzle withConstraints: [ :c | 
		c
			fill: false;
			width: 20;
			height: 20 ]
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

{ #category : 'printing' }
SpkDebuggerFramePane >> sourceText [

	^ model source
]

{ #category : 'as yet unclassified' }
SpkDebuggerFramePane >> toggleList [

	listIsShown := listIsShown  not.
	self
		updateTwizzleIcon;
		updateListVisibility
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> twizzleIcon [

	^ listIsShown
		  ifTrue: [ self iconNamed: #treeExpanded ]
		  ifFalse: [ self iconNamed: #treeUnexpanded ]
]

{ #category : 'as yet unclassified' }
SpkDebuggerFramePane >> updateListVisibility [

	listIsShown
		ifTrue: [ self layout add: self list after: topLayout ]
		ifFalse: [ 
			self layout
				remove: self list
				ifAbsent: [ "Won't be there during initialization" ] ]
]

{ #category : 'actions' }
SpkDebuggerFramePane >> updateTwizzleIcon [

	twizzle icon: self twizzleIcon
]
