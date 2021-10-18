Class {
	#name : 'SpkProcessService',
	#superclass : 'RsrService',
	#instVars : [
		'updatedServices',
		'name',
		'oop',
		'priority',
		'stack',
		'status'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkProcessService class >> templateClassName [

	^ #SpkProcessService
]

{ #category : 'accessing' }
SpkProcessService >> name [

	^name
]

{ #category : 'accessing' }
SpkProcessService >> oop [

	^oop
]

{ #category : 'accessing' }
SpkProcessService >> priority [

	^priority
]

{ #category : 'accessing' }
SpkProcessService >> stack [

	^stack
]

{ #category : 'accessing' }
SpkProcessService >> status [

	^status
]
