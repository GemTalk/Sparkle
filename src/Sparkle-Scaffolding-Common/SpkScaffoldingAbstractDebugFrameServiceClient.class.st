Class {
	#name : 'SpkScaffoldingAbstractDebugFrameServiceClient',
	#superclass : 'SpkScaffoldingDebugFrameService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingAbstractDebugFrameServiceClient >> label [

	^label ifNil: [ label := remoteSelf label wait ]
]

{ #category : 'accessing' }
SpkScaffoldingAbstractDebugFrameServiceClient >> methodSource [

	^methodSource ifNil: [ methodSource := remoteSelf methodSource wait ]
]

{ #category : 'printing' }
SpkScaffoldingAbstractDebugFrameServiceClient >> printOn: aStream [

	aStream
		nextPutAll: self label
]

{ #category : 'accessing' }
SpkScaffoldingAbstractDebugFrameServiceClient >> variableMap [

	^variableMap ifNil: [ variableMap := remoteSelf variableMap wait ]
]
