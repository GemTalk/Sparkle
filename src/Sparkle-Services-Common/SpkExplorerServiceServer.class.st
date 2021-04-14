Class {
	#name : 'SpkExplorerServiceServer',
	#superclass : 'SpkExplorerService',
	#instVars : [
		'tool'
	],
	#classInstVars : [
		'serviceClassesForToolTypes'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'class initialization' }
SpkExplorerServiceServer class >> initialize [
	self initializeServiceClassesForToolTypes
]

{ #category : 'initialization' }
SpkExplorerServiceServer class >> initializeServiceClassesForToolTypes [

	serviceClassesForToolTypes := IdentityDictionary new.
	^ serviceClassesForToolTypes
		  at: SpkCompilationErrorTool put: SpkCompilationErrorServiceServer;
		  at: SpkDebuggerTool put: SpkDebuggerServiceServer;
		  at: SpkRuntimeErrorTool put: SpkRuntimeErrorServiceServer;
		  at: SpkInspectorTool put: SpkInspectorServiceServer;
		  yourself
]

{ #category : 'accessing' }
SpkExplorerServiceServer class >> serviceClassesForToolTypes [

	^ serviceClassesForToolTypes
]

{ #category : 'accessing' }
SpkExplorerServiceServer class >> serviceClassForToolClass: aToolClass [

	^ self serviceClassesForToolTypes
		  at: aToolClass
		  ifAbsent: [ self error: 'Unrecognized tool class ' , aToolClass name ]
]

{ #category : 'initialization' }
SpkExplorerServiceServer >> defaultLayout [

	^ SpkExplorerLayoutServiceServer new
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> initializeFromTool: aTool [
	tool := aTool.
	self refreshFromTool
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> refreshFromTool [
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> tool [

	^ tool
]
