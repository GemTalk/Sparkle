"
Makes service servers out of tools in a centralized way.
"
Class {
	#name : 'SpkServiceFactory',
	#superclass : 'Object',
	#classInstVars : [
		'serviceClassesForToolTypes'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'class initialization' }
SpkServiceFactory class >> initialize [
	self initializeServiceClassesForToolTypes
]

{ #category : 'class initialization' }
SpkServiceFactory class >> initializeServiceClassesForToolTypes [
	serviceClassesForToolTypes := IdentityDictionary new.
	^ serviceClassesForToolTypes
		at: SpkCompilationErrorTool put: SpkCompilationErrorServiceServer;
		at: SpkDebuggerTool put: SpkDebuggerServiceServer;
		at: SpkExplorerTool put: SpkExplorerServiceServer;
		at: SpkInspectorTool put: SpkInspectorServiceServer;
		at: SpkProcessListTool put: SpkProcessListServiceServer;
		at: SpkProcessTerminatedTool put: SpkProcessTerminatedServiceServer;
		at: SpkProcessTool put: SpkProcessServiceServer;
		at: SpkRuntimeErrorTool put: SpkRuntimeErrorServiceServer;
		at: SpkSuccessTool put: SpkSuccessServiceServer;
		at: SpkTaskspaceTool put: SpkTaskspaceServiceServer;
		yourself
]

{ #category : 'accessing' }
SpkServiceFactory class >> serviceClassForToolClass: aToolClass [

	^ serviceClassesForToolTypes
		  at: aToolClass
		  ifAbsent: [ self error: 'Unrecognized tool class ' , aToolClass name ]
]

{ #category : 'accessing' }
SpkServiceFactory class >> serviceForTool: aTool [
	| serviceClass |
	serviceClass := self serviceClassForToolClass: aTool class.
	^ serviceClass new
		initializeFromTool: aTool;
		yourself
]
