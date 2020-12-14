Class {
	#name : 'SpkExplorerServiceServer',
	#superclass : 'SpkExplorerService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#instVars : [
		'tool'
	],
	#classInstVars : [
		'serviceClassesForToolTypes'
	],
	#category : 'Sparkle-Services-PharoServer-Services'
}

{ #category : 'instance creation' }
SpkExplorerServiceServer class >> forTool: anExplorerTool [

	^ self new
		  tool: anExplorerTool;
		  yourself
]

{ #category : 'initialization' }
SpkExplorerServiceServer class >> initializeServiceClassesForToolTypes [

	serviceClassesForToolTypes := IdentityDictionary new.
	^ serviceClassesForToolTypes
		  at: SpkInspectorTool put: SpkInspectorServiceServer;
		  yourself
]

{ #category : 'as yet unclassified' }
SpkExplorerServiceServer class >> serviceClassForToolClass: aToolClass [

	^ self serviceClassesForToolTypes
		  at: aToolClass
		  ifAbsent: [ self error: 'Unrecognized tool class' ]
]

{ #category : 'accessing' }
SpkExplorerServiceServer class >> serviceClassesForToolTypes [

	^ serviceClassesForToolTypes ifNil: [ 
		  self initializeServiceClassesForToolTypes ]
]

{ #category : 'initialization' }
SpkExplorerServiceServer >> defaultLayout [

	^ SpkExplorerLayoutServiceServer new
]

{ #category : 'as yet unclassified' }
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
