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

	aStream nextPutAll: self suspendedProcessReportString.
	self messageText ifNotNil: [ :txt | 
		aStream nextPutAll: ' (' , txt , ')' ]
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebugProcessServiceClient >> resume [

	^ remoteSelf resume
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebugProcessServiceClient >> resumeWith: anObject [

	^ remoteSelf resumeWith: anObject
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> rowanFrameServices [

	^ rowanFrameServices ifNil: [ rowanFrameServices := remoteSelf rowanFrameServices wait ]
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebugProcessServiceClient >> stepIntoFromLevel: aLevel [

	^ remoteSelf stepIntoFromLevel: aLevel
]

{ #category : 'debbuger process control' }
SpkScaffoldingDebugProcessServiceClient >> stepOverFromLevel: aLevel [

	^ (remoteSelf stepOverFromLevel: aLevel) 
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceClient >> suspendedProcessName [

	^ remoteSelf suspendedProcessName wait
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessServiceClient >> suspendedProcessOop [ 

^ suspendedProcessOop ifNil: [ suspendedProcessOop := remoteSelf suspendedProcessOop wait ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessServiceClient >> suspendedProcessReportString [

	^ remoteSelf suspendedProcessReportString wait
]
