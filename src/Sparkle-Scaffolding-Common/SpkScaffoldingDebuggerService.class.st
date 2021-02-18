Class {
	#name : 'SpkScaffoldingDebuggerService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'doitResult',
		'processService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingDebuggerService class >> templateClassName [

	^ #SpkScaffoldingDebuggerService
]

{ #category : 'accessing' }
SpkScaffoldingDebuggerService >> processService [
	^processService
]

{ #category : 'accessing' }
SpkScaffoldingDebuggerService >> processService: object [
GsFile gciLogServer: ' ---> SpkScaffoldingAbstractService>>processService: ', object printString.
	processService := object
]
