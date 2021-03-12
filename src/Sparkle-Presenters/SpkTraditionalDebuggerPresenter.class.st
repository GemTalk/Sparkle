Class {
	#name : 'SpkTraditionalDebuggerPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'frameList',
		'processService',
		'sourceCode',
		'debuggerService',
		'toolbar',
		'variableList'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'menus' }
SpkTraditionalDebuggerPresenter >> addBreakpointMenuItemsIn: aMenu [

	aMenu addItem: [ :menuItem | 
		menuItem
			name: 'Add Breakpoint';
			action: [ self notify: 'adding breakpoint someday' ] ]
]

{ #category : 'menus' }
SpkTraditionalDebuggerPresenter >> breakpointMenu [

	| aMenu |
	aMenu := self newMenu.
	self addBreakpointMenuItemsIn: aMenu.
	^ aMenu
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> closeWindow [

	self window close
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> connectPresenters [

	super connectPresenters.
	frameList whenSelectionChangedDo: [ :selection | self displayFrameDetails ]
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

	self displaySource.
	self displayVariables. 
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> displaySource [

	^ frameList selection selectedItem ifNotNil: [ :frame | 
		  sourceCode text: frame value methodService source.
		  self showSourcePositionIn: frame ]
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
SpkTraditionalDebuggerPresenter >> doIt [

	debuggerService doit_01: sourceCode selection 
]

{ #category : 'constants' }
SpkTraditionalDebuggerPresenter >> glueSelectors [
	"when showing a stack, select the frame just above these methods"
	^#(#halt #_signalAsync) 
]

{ #category : 'private' }
SpkTraditionalDebuggerPresenter >> ifConnectedDo: symbol [

	debuggerService connection isOpen ifTrue: [ debuggerService perform: symbol ].
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

	self layout add: (frameList := self newTable beSingleSelection
			              addColumn: (SpImageTableColumn new
					               width: 20;
					               evaluated: [ :assoc | assoc key printString ]);
			              addColumn:
			              (SpImageTableColumn new evaluated: [ :assoc | 
				               assoc value label ]))
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializePresenters [

	super initializePresenters.
	self initializeStackLabel.
	self initializeFrameListLayout.
	self initializeDebuggerToolbar. 
	self initializeSourceCodeLayout.
	self initializeVariablePaneLabel. 
	self initializeVariablePane.
	self layout color: Color purple muchLighter.
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeSourceCodeLayout [

	self layout add: (sourceCode := self newCode).
	sourceCode overridingContextMenu contextMenu:
		(SpMenuPresenter new addGroup: [ :group | 
			 group addItem: [ :item | 
				 item
					 name: 'Add Breakpoint';
					 icon: (self iconNamed: #glamorousBug);
					 action: [ self setBreakpoint ] ] ])
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeStackLabel [

	self layout
		add: (self newLabel label: 'Stack')
		withConstraints: [ :constraints | constraints height: 25 ]
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeVariablePane [

	self layout add: (variableList := self newTable beSingleSelection
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
					                  evaluated: [ :varArray | varArray last ]))
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeVariablePaneLabel [

	self layout
		add: (self newLabel label: 'Variables')
		withConstraints: [ :constraints | constraints height: 25 ]
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Traditional Debugger';
		"borderColor: Color purple;
		borderWidth: 3; 'no longer works not sure why'"
		initialExtent: 750 @ 1000;
		whenClosedDo: [ self terminate ]
]

{ #category : 'accessing' }
SpkTraditionalDebuggerPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> printIt [

	| result |
	result := debuggerService doit_01: sourceCode selection.
	sourceCode halt 
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> restart [

	debuggerService trimStackToLevel: frameList selection selectedIndex. 
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> resume [

	self ifConnectedDo: #resume. 
	self closeWindow
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

	"debuggerService setBreakpointForClass: frame value methodService className meta: isMeta selector: frame value methodService selector atStepPoint: stepPoint"

	frameList selection selectedItem ifNotNil: [ :frame | 
		| methodService |
		methodService := frame value methodService.
		debuggerService
			setBreakpointForClass: methodService className
			meta: methodService meta
			selector: methodService selector asSymbol
			atStepPoint:
			(sourceCode selectionInterval isEmpty ifTrue:[1] ifFalse:[self
				 stepPoint: methodService
				 fromOffset: sourceCode selectionInterval first]) ]
]

{ #category : 'private' }
SpkTraditionalDebuggerPresenter >> showSourcePositionIn: frame [

	^ sourceCode
		  removeAllTextSegmentDecorations;
		  addTextSegmentDecoration: (SpTextPresenterDecorator new
				   highlightColor: (Color orange alpha: 0.5);
				   underlineColor: Color transparent;
				   interval: (frame value startPos to: frame value stopPos + 1);
				   yourself)
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
		              (array first - offset) abs with: array first. 
			             ]) asSortedCollection: [:x :y | x first <= y first].
	^ distances first last
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> terminate [

	self ifConnectedDo: #terminate.
	self closeWindow
]
