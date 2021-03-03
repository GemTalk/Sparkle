Class {
	#name : 'SpkTraditionalDebuggerPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'frameList',
		'processService',
		'sourceCode',
		'debuggerService',
		'toolbar'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> closeWindow [

	self window close
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> connectPresenters [

	super connectPresenters.
	frameList whenSelectionChangedDo: [ :selection | self displaySource ]
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
SpkTraditionalDebuggerPresenter >> displaySource [

	^ frameList selection selectedItem ifNotNil: [ :frame | 
		  sourceCode text: frame value methodService source.
		  self showSourcePositionIn: frame ]
]

{ #category : 'private' }
SpkTraditionalDebuggerPresenter >> ifConnectedDo: symbol [

	debuggerService connection isOpen ifTrue: [ debuggerService perform: symbol ].
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeDebuggerToolbar [

	toolbar := self newToolbar.
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Resume';
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
		(frames collect: [ :frame | (frames indexOf: frame) -> frame ])
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeFrameListLayout [

	self layout add: (frameList := self newTable beSingleSelection
			              addColumn: (SpImageTableColumn new
					               width: 20;
					               evaluated: [ :assoc | assoc key printString ]);
			              addColumn:
			              (SpImageTableColumn new evaluated: [ :assoc | 
				               assoc value label]))
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializePresenters [

	super initializePresenters.
	self initializeStackLabel.
	self initializeFrameListLayout.
	self initializeDebuggerToolbar. 
	self initializeSourceCodeLayout.
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeSourceCodeLayout [

	self layout add: (sourceCode := self newText)
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeStackLabel [

	self layout
		add: (self newLabel label: 'Stack')
		withConstraints: [ :constraints | constraints height: 25 ]
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Traditional Debugger';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 750 @ 500;
		whenClosedDo: [ self terminate ]
]

{ #category : 'accessing' }
SpkTraditionalDebuggerPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> resume [

	self ifConnectedDo: #resume. 
	self closeWindow
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
SpkTraditionalDebuggerPresenter >> terminate [

	self ifConnectedDo: #terminate.
	self closeWindow
]
