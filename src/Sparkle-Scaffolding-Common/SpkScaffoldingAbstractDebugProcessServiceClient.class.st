Class {
	#name : 'SpkScaffoldingAbstractDebugProcessServiceClient',
	#superclass : 'SpkScaffoldingDebugProcessService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'testing' }
SpkScaffoldingAbstractDebugProcessServiceClient >> foo [

	
	"MNU created on server ... odd result if the process is continued on server by topaz"

	^ remoteSelf foo
]

{ #category : 'printing' }
SpkScaffoldingAbstractDebugProcessServiceClient >> printOn: aStream [

	aStream nextPutAll: self suspendedProcessReportString.
	self messageText ifNotNil: [ :txt | 
		aStream nextPutAll: ' (' , txt , ')' ]
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebugProcessServiceClient >> resume [

	^ remoteSelf resume
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebugProcessServiceClient >> resumeWith: anObject [

	^ remoteSelf resumeWith: anObject
]

{ #category : 'suspended process' }
SpkScaffoldingAbstractDebugProcessServiceClient >> rowanFrameServices [

	^ rowanFrameServices ifNil: [ rowanFrameServices := remoteSelf rowanFrameServices wait ]
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebugProcessServiceClient >> setBreakAtStepPoint: aStepPoint [
	^ (remoteSelf setBreakAtStepPoint: aStepPoint) wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebugProcessServiceClient >> stepIntoFromLevel: aLevel [

	^ remoteSelf stepIntoFromLevel: aLevel
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebugProcessServiceClient >> stepOverFromLevel: aLevel [

	^ (remoteSelf stepOverFromLevel: aLevel) 
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebugProcessServiceClient >> stepThroughFromLevel: aLevel [

	^ remoteSelf stepThroughFromLevel: aLevel
]

{ #category : 'accessing' }
SpkScaffoldingAbstractDebugProcessServiceClient >> suspendedProcessName [

	^ remoteSelf suspendedProcessName wait
]

{ #category : 'suspended process' }
SpkScaffoldingAbstractDebugProcessServiceClient >> suspendedProcessOop [ 

^ suspendedProcessOop ifNil: [ suspendedProcessOop := remoteSelf suspendedProcessOop wait ]
]

{ #category : 'accessing' }
SpkScaffoldingAbstractDebugProcessServiceClient >> suspendedProcessReportString [

	^ remoteSelf suspendedProcessReportString wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebugProcessServiceClient >> terminate [

	^ remoteSelf terminate wait
]

{ #category : 'debbuger process control' }
SpkScaffoldingAbstractDebugProcessServiceClient >> terminate9 [

	^ remoteSelf terminate9 wait
]
