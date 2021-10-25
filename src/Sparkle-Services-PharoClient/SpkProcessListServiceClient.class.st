Class {
	#name : 'SpkProcessListServiceClient',
	#superclass : 'SpkProcessListService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'accessing' }
SpkProcessListServiceClient >> listItems [

	^self processes
]
