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

{ #category : 'instance creation' }
SpkExplorerServiceServer class >> forTool: anExplorerTool [

	^ self new
		  tool: anExplorerTool;
		  yourself
]

{ #category : 'class initialization' }
SpkExplorerServiceServer class >> initialize [
	self initializeServiceClassesForToolTypes
]

{ #category : 'initialization' }
SpkExplorerServiceServer class >> initializeServiceClassesForToolTypes [

	serviceClassesForToolTypes := IdentityDictionary new.
	^ serviceClassesForToolTypes
		  at: SpkCompilationErrorTool put: SpkCompilationErrorServiceServer;
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
		  ifAbsent: [ self error: 'Unrecognized tool class' ]
]

{ #category : 'initialization' }
SpkExplorerServiceServer >> defaultLayout [

	^ SpkExplorerLayoutServiceServer new
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> paneServiceForTool: aPaneTool [

	| serviceClass |
	serviceClass := self class serviceClassForToolClass: aPaneTool class.
	^ serviceClass forTool: aPaneTool
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> tool [

	^ tool
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> tool: anObject [

	tool := anObject
]
