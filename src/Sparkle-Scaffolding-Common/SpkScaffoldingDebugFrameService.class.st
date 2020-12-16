Class {
	#name : 'SpkScaffoldingDebugFrameService',
	#superclass : 'RsrService',
	#instVars : [
		'label'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService class >> templateClassName [

	^ #SpkScaffoldingDebugFrameService
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameService >> label [

	self subclassResponsibility
]
