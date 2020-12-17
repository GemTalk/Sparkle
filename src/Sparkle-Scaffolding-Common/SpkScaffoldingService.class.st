Class {
	#name : 'SpkScaffoldingService',
	#superclass : 'RsrService',
	#instVars : [
		'doitResult',
		'debugService',
		'doitStack',
		'processList'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingService class >> templateClassName [

	^ #SpkScaffoldingService
]

{ #category : 'accessing' }
SpkScaffoldingService >> doitStack [
	^doitStack
]

{ #category : 'accessing' }
SpkScaffoldingService >> doitStack: object [
	doitStack := object
]

{ #category : 'accessing' }
SpkScaffoldingService >> processList [
	^ processList ifNil: [ processList := Dictionary new ]
]

{ #category : 'accessing' }
SpkScaffoldingService >> processList: aDictionary [
	"keys are process oop and value is the process stack ... yes I'm using a sledgehammer"

	processList := aDictionary
]
