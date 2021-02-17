Class {
	#name : 'SpkScaffoldingDebugProcessService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'suspendedProcessOop',
		'rowanFrameServices',
		'messageText'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingDebugProcessService class >> templateClassName [

	^ #SpkScaffoldingDebugProcessService
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessService >> messageText [
	^messageText
]

{ #category : 'accessing' }
SpkScaffoldingDebugProcessService >> messageText: object [
	messageText := object
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessService >> rowanFrameServices [

	self subclassResponsibility
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessService >> suspendedProcessOop [

	self subclassResponsibility
]
