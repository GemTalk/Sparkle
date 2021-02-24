Class {
	#name : 'SpkTraditionalDebuggerPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'frameList'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkTraditionalDebuggerPresenter >> initializeFrameList: list [

	frameList items:
		(list collect: [ :string | (list indexOf: string) -> string ])
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializePresenters [

	super initializePresenters.
	self layout
		add: (self newLabel label: 'Stack')
		withConstraints: [ :constraints | constraints height: 25 ].
	self layout add: (frameList := self newTable beSingleSelection
			              addColumn: (SpImageTableColumn new
					               width: 20;
					               evaluated: [ :assoc | assoc key printString ]);
			              addColumn:
			              (SpImageTableColumn new evaluated: [ :assoc | 
				               assoc value ]))
]

{ #category : 'initialization' }
SpkTraditionalDebuggerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Traditional Debugger';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 400 @ 500
]

{ #category : 'accessing' }
SpkTraditionalDebuggerPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]
