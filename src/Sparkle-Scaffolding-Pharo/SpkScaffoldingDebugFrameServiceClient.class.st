Class {
	#name : 'SpkScaffoldingDebugFrameServiceClient',
	#superclass : 'SpkScaffoldingDebugFrameService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceClient >> label [

	^label ifNil: [ label := remoteSelf label wait ]
]
