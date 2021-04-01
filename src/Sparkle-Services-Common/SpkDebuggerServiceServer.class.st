Class {
	#name : 'SpkDebuggerServiceServer',
	#superclass : 'SpkDebuggerService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'other' }
SpkDebuggerServiceServer class >> forTool: aTool [

	^ self new
		  initializeFromTool: aTool;
		  yourself
]

{ #category : 'other' }
SpkDebuggerServiceServer >> initializeFramesFromTool [

	frames := tool frames collect: [ :frameTool | 
		          (SpkDebuggerFrameDescriptionServiceServer forTool:
				           frameTool)
			          parentService: self;
			          yourself ]
]

{ #category : 'other' }
SpkDebuggerServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	self refreshFromTool
]

{ #category : 'other' }
SpkDebuggerServiceServer >> proceed [
	| resultTool |
	resultTool := tool proceed.
	^ resultTool == tool
		ifTrue: [ 
			self refreshFromTool.
			self ]
		ifFalse: [ self serviceForTool: resultTool ]
]

{ #category : 'other' }
SpkDebuggerServiceServer >> refreshExistingFrames [
	| numberOfValidFrames frameTools |
	numberOfValidFrames := 0.
	frameTools := tool frames.
	1 to: (frames size min: frameTools size) do: [ :index | 
		(frames at: index) tool == (frameTools at: index)
			ifFalse: [ ^ numberOfValidFrames ].
		numberOfValidFrames := numberOfValidFrames + 1 ].
	^ numberOfValidFrames
]

{ #category : 'other' }
SpkDebuggerServiceServer >> refreshFramesFromTool [
	| numberOfValidFrames newStackDepth frameTools newFrames |
	numberOfValidFrames := self refreshExistingFrames.
	frameTools := tool frames.
	newStackDepth := frameTools size.
	newFrames := Array new: newStackDepth.
	newFrames
		replaceFrom: 1
		to: numberOfValidFrames
		with: frames
		startingAt: 1.
	numberOfValidFrames + 1 to: newStackDepth do: [ :index | 
		| frameTool |
		frameTool := frameTools at: index.
		newFrames
			at: index
			put:
				((SpkDebuggerFrameDescriptionServiceServer forTool: frameTool)
					parentService: self;
					yourself) ].
	^ frames := newFrames
]

{ #category : 'other' }
SpkDebuggerServiceServer >> refreshFromTool [

	exceptionDescription := tool exceptionDescription.
	processName := tool processName.
	processIdentifier := tool processIdentifier.
	processPriority := tool processPriority.
	updatedServices := tool updatedServices.
	self refreshFramesFromTool
]

{ #category : 'accessing' }
SpkDebuggerServiceServer >> serviceForTool: aTool [

	| serviceClass |
	serviceClass := SpkExplorerServiceServer serviceClassForToolClass:
		                aTool class.
	^ serviceClass forTool: aTool
]

{ #category : 'stepping' }
SpkDebuggerServiceServer >> stepOverIn: aFrameService [

	| resultTool |
	resultTool := aFrameService tool stepOver.
	^resultTool == tool
		ifTrue:
			[self refreshFromTool.
			self]
		ifFalse: [self serviceForTool: resultTool]
]

{ #category : 'other' }
SpkDebuggerServiceServer >> terminate [
	| resultTool |
	resultTool := tool terminate.
	^ resultTool == tool
		ifTrue: [ 
			self refreshFromTool.
			self ]
		ifFalse: [ self serviceForTool: resultTool ]
]
