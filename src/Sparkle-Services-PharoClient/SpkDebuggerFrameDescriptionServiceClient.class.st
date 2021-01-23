Class {
	#name : 'SpkDebuggerFrameDescriptionServiceClient',
	#superclass : 'SpkDebuggerFrameDescriptionService',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'printing' }
SpkDebuggerFrameDescriptionServiceClient >> printOn: aStream [

	aStream << 'DebuggerFrameService '.
	description printOn: aStream
]
