Class {
	#name : 'SpkProcessServiceClient',
	#superclass : 'SpkProcessService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'accessing' }
SpkProcessServiceClient >> nameOrOopHex [

	^name isEmpty
		ifTrue: [self oop hex]
		ifFalse: [name]
]
