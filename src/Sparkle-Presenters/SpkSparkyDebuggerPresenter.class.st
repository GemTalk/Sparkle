Class {
	#name : 'SpkSparkyDebuggerPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'frameList',
		'processService',
		'sourceCode',
		'debuggerService',
		'toolbar',
		'variableList',
		'workspace',
		'shouldTerminate'
	],
	#classVars : [
		'DebuggerAnnouncer'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkSparkyDebuggerPresenter class >> debuggerAnnouncer [

	^ DebuggerAnnouncer ifNil: [ DebuggerAnnouncer := Announcer new ]
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> clearAllBreaks [

	debuggerService clearAllBreaks.
	self displayTextAnnotationsIn: frameList selection selectedItem.
	sourceCode text: sourceCode text. "not sure how to refresh the display yet"
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> closeWindow [

	debuggerService clearDebugger.
	self window close.
	
]

{ #category : 'initialization' }
SpkSparkyDebuggerPresenter >> connectPresenters [

	super connectPresenters.
	frameList whenSelectionChangedDo: [ :selection | 
		self displayFrameDetails ].

	variableList whenSelectionChangedDo: [ :selection | 
		selection ifNotNil: [ :sel | 
			sel selectedItem ifNotNil: [ :item | 
				workspace contextOop: (item at: 2).
				workspace text: (item at: 3) ] ] ]
]

{ #category : 'accessing' }
SpkSparkyDebuggerPresenter >> debuggerService [

	^ debuggerService
]

{ #category : 'accessing' }
SpkSparkyDebuggerPresenter >> debuggerService: anObject [

	debuggerService := anObject
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> displayFrameDetails [

	frameList selection selectedItem ifNotNil: [ :frame | 
		debuggerService methodService: frame value methodService ].
	self displaySource.
	self displayVariables
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> displaySource [

	frameList selection selectedItem ifNotNil: [ :frame | 
		sourceCode text: frame value methodService source.
		self displayTextAnnotationsIn: frame ]
]

{ #category : 'private' }
SpkSparkyDebuggerPresenter >> displayTextAnnotationsIn: frame [

	sourceCode removeAllTextSegmentDecorations.
	sourceCode update. 
	frame ifNotNil: [ 
		self showSourcePositionIn: frame.
		self showBreakPoints ]
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> displayVariables [

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
SpkSparkyDebuggerPresenter >> doItIn: pane context: contextOop [

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

{ #category : 'private - actions' }
SpkSparkyDebuggerPresenter >> executeDebuggerAction: aBlock [

	[ aBlock value ]
		on: RsrBrokenPromise
		do: [ :ex | 
			UIManager default
				alert: ex reason messageText
				title: 'Sparkle Failure' ]
]

{ #category : 'constants' }
SpkSparkyDebuggerPresenter >> glueSelectors [
	"when showing a stack, select the frame just above these methods"
	^#(#halt #_signalAsync #_doesNotUnderstand:args:envId:reason: #_signalFromPrimitive:) 
]

{ #category : 'initialization' }
SpkSparkyDebuggerPresenter >> initialize [

	super initialize. 
	shouldTerminate := true
]

{ #category : 'initialization' }
SpkSparkyDebuggerPresenter >> initializeDebuggerToolbar [

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
SpkSparkyDebuggerPresenter >> initializeFrameList [

	| frames |
	processService := debuggerService processService.
	self window title: processService printString.
	frames := processService rowanFrameServices.
	frameList items:
		(frames collect: [ :frame | (frames indexOf: frame) -> frame ]).
	self selectAppropriateFrame
]

{ #category : 'initialization' }
SpkSparkyDebuggerPresenter >> initializeFrameListLayout [

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
SpkSparkyDebuggerPresenter >> initializePresenters [

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
	self layout color: SpkConnectionListPresenter defaultColor
]

{ #category : 'initialization' }
SpkSparkyDebuggerPresenter >> initializeSourceCodeLayout [

	self layout add: (sourceCode := self instantiate: SpkWorkspacePresenter).
	self overrideSourceCodeMenu
]

{ #category : 'initialization' }
SpkSparkyDebuggerPresenter >> initializeStackLabel [

	self layout
		add: (self newLabel label: 'Stack')
		withConstraints: [ :constraints | constraints height: 25 ]
]

{ #category : 'initialization' }
SpkSparkyDebuggerPresenter >> initializeVariablePaneIn: box [

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
	box add: verticalBox.
	self overrideVariableListMenu
]

{ #category : 'initialization' }
SpkSparkyDebuggerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Traditional Debugger';
		"borderColor: Color purple;
		borderWidth: 3; 'no longer works not sure why'"
		initialExtent: 750 @ 1000;
		whenClosedDo: [ shouldTerminate ifTrue: [ self terminate ] ]
]

{ #category : 'initialization' }
SpkSparkyDebuggerPresenter >> initializeWorkspacePaneIn: box [

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

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> inspectVariable [

	SparkyInspector on: (variableList selectedItem at: 2)
]

{ #category : 'testing' }
SpkSparkyDebuggerPresenter >> isExecutedCodeFrame [

	^ '*Executed Code*' match:
		  frameList selection selectedItem value printString
]

{ #category : 'accessing' }
SpkSparkyDebuggerPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'menus' }
SpkSparkyDebuggerPresenter >> overrideSourceCodeMenu [

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
				action: [ sourceCode doIt ];
				shortcut: PharoShortcuts current doItShortcut ].
		group addItem: [ :item | 
			item
				name: 'Print It';
				action: [ sourceCode printIt ];
				shortcut: PharoShortcuts current printItShortcut ].
		group addItem: [ :item | 
			item
				name: 'Debug It';
				action: [ sourceCode debugIt ];
				shortcut: PharoShortcuts current debugItShortcut ] ]
]

{ #category : 'menus' }
SpkSparkyDebuggerPresenter >> overrideVariableListMenu [

	| menu |
	variableList contextMenu:
		(menu := SpMenuPresenter new addGroup: [ :group | 
			         group addItem: [ :item | 
				         item
					         name: 'Inspect';
					         icon: (self iconNamed: #glamorousInspect);
					         action: [ self inspectVariable ] ] ])
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> restart [

	self executeDebuggerAction: [ 
		debuggerService trimStackToLevel: frameList selection selectedIndex ]
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> resume [

	self executeDebuggerAction: [ 
		shouldTerminate := false.
		self debuggerService resume.
		self closeWindow ]
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> save [

	debuggerService
		compileMethodSource: sourceCode text asString
		at: frameList selection selectedIndexes first
]

{ #category : 'private' }
SpkSparkyDebuggerPresenter >> selectAppropriateFrame [

	"try to set the selection without touching the rsr object inappropriately"

	| glueIndex |
	frameList items do: [ :assoc | 
		| frame index |
		glueIndex ifNil: [ 
			index := assoc key.
			frame := assoc value.
			(self glueSelectors includes: frame methodService selector) 
				ifTrue: [ glueIndex := index + 1 ] ] ].
	glueIndex ifNil: [ glueIndex := 1 ].
	frameList selectIndex: glueIndex scrollToSelection: true
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> setBreakpoint [

	frameList selection selectedItem ifNotNil: [ :frame | 
		| methodService |
		methodService := frame value methodService.
		methodService className ifNil: [ 
			^ UIManager default
				  alert: 'Not able to set breakpoints in anonymous method'
				  title: 'Sparkle Failure' ].
		debuggerService
			setBreakpointForClass: methodService className asString
			meta: methodService meta
			selector: methodService homeMethodSelector asSymbol
			atStepPoint: (self
					 stepPoint: methodService
					 fromOffset: sourceCode cursorPositionIndex).
		self displayTextAnnotationsIn: frameList selection selectedItem ]
]

{ #category : 'private' }
SpkSparkyDebuggerPresenter >> showBreakPoints [

	| bpSourcePositions methodService |
	debuggerService ifNil: [ ^ self ].
	methodService := debuggerService methodService ifNil: [ ^ self ].
	methodService breakPoints ifNil: [ ^ self ].
	bpSourcePositions := methodService breakPoints collect: [ :bp | 
		                     methodService stepPoints at: bp ].
	bpSourcePositions do: [ :posAndSource | 
		sourceCode addTextSegmentDecoration: (SpTextPresenterDecorator new
				 highlightColor: SpkConnectionListPresenter defaultColor;
				 interval:
					 (posAndSource first to:
						  posAndSource first + posAndSource last size);
				 yourself) ]
]

{ #category : 'private' }
SpkSparkyDebuggerPresenter >> showSourcePositionIn: frame [

	^ sourceCode addTextSegmentDecoration: (SpTextPresenterDecorator new
			   highlightColor: (Color orange alpha: 0.5);
			   underlineColor: Color transparent;
			   interval: (frame value startPos to: frame value stopPos + 1);
			   yourself)
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> stepInto [

	self executeDebuggerAction: [ 
		debuggerService stepIntoFromLevel: frameList selection selectedIndex ]
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> stepOver [

	self executeDebuggerAction: [ 
		debuggerService stepOverFromLevel: frameList selection selectedIndex ]
]

{ #category : 'private' }
SpkSparkyDebuggerPresenter >> stepPoint: methodService fromOffset: offset [

	| distances |
	distances := (methodService stepPoints collect: [ :array | 
							Array with: 
		              (array first - offset) abs with: (methodService stepPoints indexOf: array). 
			             ]) asSortedCollection: [:x :y | x first <= y first].
	^ distances first last
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> stepThrough [

	self executeDebuggerAction: [ 
		debuggerService stepThroughFromLevel:
			frameList selection selectedIndex ]
]

{ #category : 'actions' }
SpkSparkyDebuggerPresenter >> terminate [

	debuggerService terminate.
	self closeWindow
]
