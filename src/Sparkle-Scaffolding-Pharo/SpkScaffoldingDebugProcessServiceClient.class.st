Class {
	#name : 'SpkScaffoldingDebugProcessServiceClient',
	#superclass : 'SpkScaffoldingDebugProcessService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> rowanFrameServices [

	^ rowanFrameServices ifNil: [ rowanFrameServices := remoteSelf rowanFrameServices wait ]
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> rowanProcessService [

	^ rowanProcessService ifNil: [ 
		  rowanProcessService := remoteSelf rowanProcessService wait ]
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> suspendedProcessOop [ 

^ suspendedProcessOop ifNil: [ suspendedProcessOop := remoteSelf suspendedProcessOop wait ]
]
