Class {
	#name : 'SpkAtGenericException',
	#superclass : 'SpkAtException',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkAtGenericException >> description [
	^ exception class name asString , self exceptionSpecificMessage
]

{ #category : 'accessing' }
SpkAtGenericException >> exceptionSpecificMessage [
	| fullMessage commaIndex latterPart |
	fullMessage := exception buildMessageText.
	fullMessage ifNil: [ ^ '' ].
	commaIndex := fullMessage indexOf: $,.
	latterPart := commaIndex = 0
		ifTrue: [ fullMessage ]
		ifFalse: [ fullMessage copyFrom: commaIndex + 1 to: fullMessage size ].
	^ ' - ' , latterPart
]

{ #category : 'dispatching' }
SpkAtGenericException >> markTopGlueFor: aDebuggerTool [
	^ aDebuggerTool markTopGlueForException: exception
]
