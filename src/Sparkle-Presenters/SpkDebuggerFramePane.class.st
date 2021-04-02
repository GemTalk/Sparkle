Class {
	#name : 'SpkDebuggerFramePane',
	#superclass : 'SpkPaneWithTwizzledList',
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
		initializeSourcePane;
		defer: [ "Decoration cannot be added until the code adapter is built (issue 49)" 
			self updateFromModel ]
]

{ #category : 'initialization' }
SpkDebuggerFramePane >> initializeSourcePane [

	sourcePresenter := self newCode
		                   beNotEditable;
		                   withoutLineNumbers;
		                   yourself.
	self layout add: sourcePresenter
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

{ #category : 'initialization' }
SpkDebuggerFramePane >> updateFromModel [

	self
		refreshTwizzledList;
		refreshSourcePane
]
