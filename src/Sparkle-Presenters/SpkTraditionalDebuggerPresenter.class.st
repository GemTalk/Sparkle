Class {
	#name : 'SpkTraditionalDebuggerPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'frameList',
		'processService',
		'sourceCode'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> connectPresenters [

	super connectPresenters.
	frameList whenSelectionChangedDo: [ :selection | self displaySource ]
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> displaySource [

	^ frameList selection selectedItem ifNotNil: [ :frame | 
		  sourceCode text: frame value methodService source.
		  self showSourcePositionIn: frame ]
]

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> initializeFrameList: theProcessService [

	| frames |
	processService := theProcessService.
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
		initialExtent: 750 @ 500
]

{ #category : 'accessing' }
SpkTraditionalDebuggerPresenter >> newLayout [

	^ SpkBoxLayout newVertical
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
