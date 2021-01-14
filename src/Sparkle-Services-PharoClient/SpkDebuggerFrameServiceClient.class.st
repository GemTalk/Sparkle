Class {
	#name : 'SpkDebuggerFrameServiceClient',
	#superclass : 'SpkDebuggerFrameService',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'printing' }
SpkDebuggerFrameServiceClient >> printOn: aStream [

	aStream << 'DebuggerFrameService '.
	description printOn: aStream
]
