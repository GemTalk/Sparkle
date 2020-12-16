Class {
	#name : 'SpkScaffoldingDebugProcessService',
	#superclass : 'RsrService',
	#instVars : [
		'suspendedProcessOop',
		'rowanFrameServices',
		'rowanProcessService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingDebugProcessService class >> templateClassName [

	^ #SpkScaffoldingDebugProcessService
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessService >> rowanFrameServices [

	self subclassResponsibility
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessService >> rowanProcessService [

	self subclassResponsibility
]

{ #category : 'suspended process' }
SpkScaffoldingDebugProcessService >> suspendedProcessOop [

	self subclassResponsibility
]
