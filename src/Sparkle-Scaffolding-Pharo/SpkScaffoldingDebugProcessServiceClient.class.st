Class {
	#name : 'SpkScaffoldingDebugProcessServiceClient',
	#superclass : 'SpkScaffoldingDebugProcessService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'testing' }
SpkScaffoldingDebugProcessServiceClient >> foo [

	
	"MNU created on server ... odd result if the process is continued on server by topaz"

	^ remoteSelf foo
]

{ #category : 'printing' }
SpkScaffoldingDebugProcessServiceClient >> printOn: aStream [

	aStream nextPutAll: self suspendedProcessName.
	self messageText ifNotNil: [ :txt | aStream nextPutAll:' (' , txt , ')' ]
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> resume [

	^ remoteSelf resume
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> resumeWith: anObject [

	^ remoteSelf resumeWith: anObject
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
