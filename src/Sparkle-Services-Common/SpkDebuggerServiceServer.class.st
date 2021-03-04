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
	resultTool := tool continue.
	self refreshFromTool.
	^ resultTool == tool
		ifTrue: [ self ]
		ifFalse: [ self serviceForTool: resultTool ]
]

{ #category : 'other' }
SpkDebuggerServiceServer >> refreshFromTool [

	exceptionDescription := tool exceptionDescription.
	processName := tool processName.
	processIdentifier := tool processIdentifier.
	processPriority := tool processPriority.
	updatedInspectors := tool updatedInspectors.
	self initializeFramesFromTool
]

{ #category : 'accessing' }
SpkDebuggerServiceServer >> serviceForTool: aTool [

	| serviceClass |
	serviceClass := SpkExplorerServiceServer serviceClassForToolClass:
		                aTool class.
	^ serviceClass forTool: aTool
]

{ #category : 'other' }
SpkDebuggerServiceServer >> terminate [
	tool terminate.
	self refreshFromTool
]
