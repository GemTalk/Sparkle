Class {
	#name : 'SpkScaffoldingDebuggerService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'doitResult',
		'processService',
		'methodService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingDebuggerService class >> templateClassName [

	^ #SpkScaffoldingDebuggerService
]

{ #category : 'accessing' }
SpkScaffoldingDebuggerService >> methodService [

	^ methodService
]

{ #category : 'accessing' }
SpkScaffoldingDebuggerService >> methodService: object [
	methodService := object
]

{ #category : 'accessing' }
SpkScaffoldingDebuggerService >> processService [
	^processService
]

{ #category : 'accessing' }
SpkScaffoldingDebuggerService >> processService: object [
	processService := object
]
