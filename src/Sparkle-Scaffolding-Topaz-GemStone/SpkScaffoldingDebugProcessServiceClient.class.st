Class {
	#name : 'SpkScaffoldingDebugProcessServiceClient',
	#superclass : 'SpkScaffoldingDebugProcessService',
	#category : 'Sparkle-Scaffolding-Topaz-GemStone'
}

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> continue [
	"wnat this to do what GCI continue does ... arrange to resume an exception and return the result of the process coninuing"

	^ self resume
]

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
