Class {
	#name : 'SpkRuntimeErrorServiceServer',
	#superclass : 'SpkRuntimeErrorService',
	#category : 'Sparkle-Services-PharoServer-Services'
}

{ #category : 'instance creation' }
SpkRuntimeErrorServiceServer class >> forTool: aColumnLayoutTool [

	^ self new
		  initializeFromTool: aColumnLayoutTool;
		  yourself
]

{ #category : 'initialization' }
SpkRuntimeErrorServiceServer >> initializeFromTool: aTool [

	title := aTool title.
	stack := aTool stack
]
