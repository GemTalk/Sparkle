Class {
	#name : 'SpkTraditionalDebuggerPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'frameList',
		'processService',
		'sourceCode',
		'debuggerService',
		'toolbar',
		'variableList',
		'workspace'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> clearAllBreaks [

	debuggerService clearAllBreaks.
	self displayTextAnnotationsIn: frameList selection selectedItem.
	sourceCode text: sourceCode text. "not sure how to refresh the display yet"
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> closeWindow [

	debuggerService clearDebugger.
	self window close.
	
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> connectPresenters [

	super connectPresenters.
	frameList whenSelectionChangedDo: [ :selection | 
		self displayFrameDetails ].

	variableList whenSelectionChangedDo: [ :selection | 
		selection ifNotNil: [ :sel | 
			sel selectedItem ifNotNil: [ :item | 
				workspace contextOop: (item at: 2) ] ] ]
]

{ #category : 'accessing' }
SpkTraditionalDebuggerPresenter >> debuggerService [

	^ debuggerService
]

{ #category : 'accessing' }
SpkTraditionalDebuggerPresenter >> debuggerService: anObject [

	debuggerService := anObject
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> displayFrameDetails [

	frameList selection selectedItem ifNotNil: [ :frame | 
		debuggerService methodService: frame value methodService ].
	self displaySource.
	self displayVariables
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> displaySource [

	frameList selection selectedItem ifNotNil: [ :frame | 
		sourceCode text: frame value methodService source.
		self displayTextAnnotationsIn: frame ]
]

{ #category : 'private' }
SpkTraditionalDebuggerPresenter >> displayTextAnnotationsIn: frame [

	sourceCode removeAllTextSegmentDecorations.
	sourceCode update. 
	frame ifNotNil: [ 
		self showSourcePositionIn: frame.
		self showBreakPoints ]
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> displayVariables [

	frameList selection selectedItem ifNotNil: [ :frame | 
		| varArray |
		varArray := frame value variableMap associations collect: [ :assoc | 
			            OrderedCollection
				            with: assoc key
				            with: (frame value variableOopMap at: assoc key)
				            with: assoc value ].
		variableList items:
			(varArray asSortedCollection: [ :x :y | x first < y first ]) ]
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> doItIn: pane context: contextOop [

	| service debuggerClient promise doItResult semaphore |
	service := SpkScaffoldingServiceClient new registerWith:
		           SpkConnectionProfile defaultConnection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new
		                  registerWith:
			                  SpkConnectionProfile defaultConnection;
		                  synchronize.
	promise := service
		           gsDebugger_07: pane selectedText
		           usingDebugger: debuggerClient
		           contextOop: contextOop.
	semaphore := Smalltalk
		             at: #SPARKLE_DEBUGGER_SEMAPHORE
		             put: Semaphore new.
	promise
		when: [ :result | 
			doItResult := result doitResult.
			semaphore signal ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself.
			semaphore signal ].
	semaphore wait.
	^ doItResult
]

{ #category : 'constants' }
SpkTraditionalDebuggerPresenter >> glueSelectors [
	"when showing a stack, select the frame just above these methods"
	^#(#halt #_signalAsync #_doesNotUnderstand:args:envId:reason:) 
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeDebuggerToolbar [

	toolbar := self newToolbar.
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Proceed';
			 icon: (self iconNamed: #smallForward);
			 help: 'Resume the suspended process';
			 action: [ self resume ];
			 yourself).
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Terminate';
			 icon: (self iconNamed: #smallCancel);
			 help: 'Terminate the suspended process';
			 action: [ self terminate ];
			 yourself).
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Step Over';
			 icon: (self iconNamed: #glamorousOver);
			 help: 'Step Over';
			 action: [ self stepOver ];
			 yourself).
	toolbar addItem: (SpToolbarButtonPresenter new  
			 label: 'Step Through';
			 icon: (self iconNamed: #glamorousRightSide);
			 help: 'Step Over';
			 action: [ self stepThrough ];
			 yourself).
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Step Into';
			 icon: (self iconNamed: #glamorousInto);
			 help: 'Step Into';
			 action: [ self stepInto ];
			 yourself).
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Restart';
			 icon: (self iconNamed: #glamorousRestart);
			 help: 'Restart';
			 action: [ self restart ];
			 yourself).

	self layout
		add: toolbar
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> initializeFrameList [

	| frames |
	processService := debuggerService processService.
	self window title: processService printString.
	frames := processService rowanFrameServices.
	frameList items:
		(frames collect: [ :frame | (frames indexOf: frame) -> frame ]).
	self selectAppropriateFrame
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeFrameListLayout [

	self layout add:
		(frameList := self newTable beSingleSelection beResizable hideColumnHeaders
			              addColumn: (SpImageTableColumn new
					               width: 20;
					               evaluated: [ :assoc | assoc key printString ]);
			              addColumn:
			              (SpImageTableColumn new evaluated: [ :assoc | 
				               assoc value label ]))
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializePresenters [

	| bottomPaneBox |
	super initializePresenters.
	self initializeStackLabel.
	self initializeFrameListLayout.
	self initializeDebuggerToolbar.
	self initializeSourceCodeLayout.
	bottomPaneBox := SpkBoxLayout newHorizontal.
	self initializeVariablePaneIn: bottomPaneBox.
	self initializeWorkspacePaneIn: bottomPaneBox. 
	self layout add: bottomPaneBox.
	self layout color: Color purple muchLighter
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeSourceCodeLayout [

	self layout add: (sourceCode := self newCode).
	self overrideSourceCodeMenu
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeStackLabel [

	self layout
		add: (self newLabel label: 'Stack')
		withConstraints: [ :constraints | constraints height: 25 ]
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeVariablePaneIn: box [

	| verticalBox |
	verticalBox := SpkBoxLayout newVertical borderWidth: 3.
	verticalBox
		add: (self newLabel label: 'Variables') 
		withConstraints: [ :constraints | constraints height: 25 ].
	verticalBox add: (variableList := self newTable beSingleSelection
			                 addColumn: (SpImageTableColumn new
					                  width: 150;
					                  title: 'Name';
					                  evaluated: [ :varArray | 
						                  varArray first asString ]);
			                 addColumn: (SpImageTableColumn new
					                  width: 100;
					                  title: 'Oop';
					                  evaluated: [ :varArray | 
						                  varArray second asString ]);
			                 addColumn: (SpImageTableColumn new
					                  title: 'Value';
					                  evaluated: [ :varArray | varArray last ])).
	box add: verticalBox
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Traditional Debugger';
		"borderColor: Color purple;
		borderWidth: 3; 'no longer works not sure why'"
		initialExtent: 750 @ 1000
		
		
		";
		whenClosedDo: [ self terminate ]."
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeWorkspacePaneIn: box [

	| verticalBox |
	verticalBox := SpkBoxLayout newVertical borderWidth: 3.
	verticalBox
		add: (self newLabel label:
				 'Variable Workspace (selected variable is context)')
		withConstraints: [ :constraints | constraints height: 25 ].
	verticalBox add:
		(workspace := (self instantiate: SpkWorkspacePresenter)
			              withoutLineNumbers).
	box add: verticalBox
]

{ #category : 'testing' }
SpkTraditionalDebuggerPresenter >> isExecutedCodeFrame [

	^ '*Executed Code*' match:
		  frameList selection selectedItem value printString
]

{ #category : 'accessing' }
SpkTraditionalDebuggerPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'menus' }
SpkTraditionalDebuggerPresenter >> overrideSourceCodeMenu [

	| menu |
	sourceCode overridingContextMenu contextMenu:
		(menu := SpMenuPresenter new addGroup: [ :group | 
			         group addItem: [ :item | 
				         item
					         name: 'Add Breakpoint';
					         icon: (self iconNamed: #stop);
					         action: [ self setBreakpoint ];
					         enabled: [ self isExecutedCodeFrame not ] ].
			         group addItem: [ :item | 
				         item
					         name: 'Clear All Breakpoints';
					         action: [ self clearAllBreaks ];
					         enabled: [ self isExecutedCodeFrame not ] ] ]).
	menu addGroup: [ :group | 
		group addItem: [ :item | 
			item
				name: 'Save';
				action: [ self save ];
				enabled: [ self isExecutedCodeFrame not ];
				shortcut: PharoShortcuts current acceptShortcut ] ].
	menu addGroup: [ :group | 
		group addItem: [ :item | 
			item
				name: 'Do It';
				action: [ self sourceCodeDoIt ];
				shortcut: PharoShortcuts current doItShortcut ].
		group addItem: [ :item | 
			item
				name: 'Print It';
				action: [ self sourceCodePrintIt ];
				shortcut: PharoShortcuts current printItShortcut ] ]
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> printIt: result in: pane [

	| interval insertionOffset resultString |
	resultString := result asString. 
	interval := pane selectionInterval.
	insertionOffset := interval isEmpty
		                  ifTrue: [ pane cursorPositionIndex ]
		                  ifFalse: [ interval last ].
	pane insert: resultString at: insertionOffset + 1.
	pane selectionInterval: (insertionOffset + 1 to: insertionOffset + resultString size + 2)
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> restart [

	debuggerService trimStackToLevel: frameList selection selectedIndex. 
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> resume [

	self debuggerService resume. 
	self closeWindow
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> save [

	debuggerService
		compileMethodSource: sourceCode text asString
		at: frameList selection selectedIndexes first
]

{ #category : 'private' }
SpkTraditionalDebuggerPresenter >> selectAppropriateFrame [

	"try to set the selection without touching the rsr object inappropriately"

	| glueFrame |
	frameList items do: [ :assoc | 
		| frame index |
		glueFrame ifNil: [ 
			index := assoc key.
			frame := assoc value.
			(self glueSelectors includes: frame methodService selector) 
				ifTrue: [ glueFrame := frameList items at: index + 1 ] ] ].
	glueFrame ifNil: [ glueFrame := frameList items at: 1 ].
	frameList selectItem: glueFrame
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> setBreakpoint [

	frameList selection selectedItem ifNotNil: [ :frame | 
		| methodService |
		methodService := frame value methodService.
		debuggerService
			setBreakpointForClass: methodService className
			meta: methodService meta
			selector: methodService selector asSymbol
			atStepPoint: (self
					 stepPoint: methodService
					 fromOffset: sourceCode cursorPositionIndex).
		self displayTextAnnotationsIn: frameList selection selectedItem ]
]

{ #category : 'private' }
SpkTraditionalDebuggerPresenter >> showBreakPoints [

	| bpSourcePositions methodService |
	debuggerService ifNil: [ ^ self ].
	methodService := debuggerService methodService ifNil: [ ^ self ].
	methodService breakPoints ifNil: [ ^ self ].
	bpSourcePositions := methodService breakPoints collect: [ :bp | 
		                     methodService stepPoints at: bp ].
	bpSourcePositions do: [ :posAndSource | 
		sourceCode addTextSegmentDecoration: (SpTextPresenterDecorator new
				 highlightColor: Color purple muchLighter;
				 interval:
					 (posAndSource first to:
						  posAndSource first + posAndSource last size);
				 yourself) ]
]

{ #category : 'private' }
SpkTraditionalDebuggerPresenter >> showSourcePositionIn: frame [

	^ sourceCode addTextSegmentDecoration: (SpTextPresenterDecorator new
			   highlightColor: (Color orange alpha: 0.5);
			   underlineColor: Color transparent;
			   interval: (frame value startPos to: frame value stopPos + 1);
			   yourself)
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> sourceCodeDoIt [

	^ self
		  doItIn: sourceCode
		  context: frameList selection selectedItem value frameOop
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> sourceCodePrintIt [

	| result |
	result := self sourceCodeDoIt.
	self printIt: result in: sourceCode
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> stepInto [

	debuggerService stepIntoFromLevel: frameList selection selectedIndex. 
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> stepOver [

	debuggerService stepOverFromLevel: frameList selection selectedIndex. 
]

{ #category : 'private' }
SpkTraditionalDebuggerPresenter >> stepPoint: methodService fromOffset: offset [

	| distances |
	distances := (methodService stepPoints collect: [ :array | 
							Array with: 
		              (array first - offset) abs with: (methodService stepPoints indexOf: array). 
			             ]) asSortedCollection: [:x :y | x first <= y first].
	^ distances first last
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> stepThrough [

	debuggerService stepThroughFromLevel: frameList selection selectedIndex. 
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> terminate [

	debuggerService terminate.
	self closeWindow
]
