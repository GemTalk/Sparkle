Class {
	#name : 'SpkProcessListServiceClient',
	#superclass : 'SpkProcessListService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'accessing' }
SpkProcessListServiceClient >> listItems [

	^self processes sorted:
			[:a :b |
				a priority > b priority
					ifTrue: [true]
					ifFalse: [a priority = b priority
									ifTrue: [a nameOrOopHex = b nameOrOopHex
													ifTrue: [a oop < b oop]
													ifFalse: [a nameOrOopHex < b nameOrOopHex]]
									ifFalse: [false]]]
]
