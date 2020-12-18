Class {
	#name : 'SpkScaffoldingDebugProcessServiceClient',
	#superclass : 'SpkScaffoldingDebugProcessService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'printing' }
SpkScaffoldingDebugProcessServiceClient >> printOn: aStream [

	aStream nextPutAll: self suspendedProcessName
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> resume [

	^ remoteSelf resume
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> rowanFrameServices [

	^ rowanFrameServices ifNil: [ rowanFrameServices := remoteSelf rowanFrameServices wait ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceClient >> suspendedProcessName [

	^ remoteSelf suspendedProcessName wait
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> suspendedProcessOop [ 

^ suspendedProcessOop ifNil: [ suspendedProcessOop := remoteSelf suspendedProcessOop wait ]
]
