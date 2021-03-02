Class {
	#name : 'SpkDebuggerServiceClient',
	#superclass : 'SpkDebuggerService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'api' }
SpkDebuggerServiceClient >> listItems [

	^ frames reverse
]
