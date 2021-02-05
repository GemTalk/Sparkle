Trait {
	#name : 'SpkTLinkedService',
	#instVars : [
		'linkedService'
	],
	#category : 'Sparkle-Services-PharoClient-Support'
}

{ #category : 'accessing' }
SpkTLinkedService >> linkedService [

	^ linkedService
]

{ #category : 'accessing' }
SpkTLinkedService >> linkedService: anObject [

	linkedService := anObject
]
