Class {
	#name : 'SpkScaffoldingTopazService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'doitResult',
		'debugService',
		'doitStack',
		'processList'
	],
	#category : 'Sparkle-Scaffolding-Topaz-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingTopazService class >> templateClassName [

	^ #SpkScaffoldingTopazService
]

{ #category : 'accessing' }
SpkScaffoldingTopazService >> doitStack [
	^doitStack
]

{ #category : 'accessing' }
SpkScaffoldingTopazService >> doitStack: object [
	doitStack := object
]

{ #category : 'accessing' }
SpkScaffoldingTopazService >> processList [
	^ processList ifNil: [ processList := Dictionary new ]
]

{ #category : 'accessing' }
SpkScaffoldingTopazService >> processList: aDictionary [
	"keys are process oop and value is the process stack ... yes I'm using a sledgehammer"

	processList := aDictionary
]
