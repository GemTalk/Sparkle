"
Makes service servers out of tools in a centralized way.
"
Class {
	#name : 'SpkServiceFactory',
	#superclass : 'Object',
	#classInstVars : [
		'serviceClassesForToolTypes'
	],
	#category : 'Sparkle-Services-Utility-Server',
	#package : 'Sparkle-Services-Utility-Server'
}

{ #category : 'class initialization' }
SpkServiceFactory class >> initializeServiceClassesForToolTypes [
	"self initializeServiceClassesForToolTypes"

	serviceClassesForToolTypes := IdentityDictionary new.
	^ serviceClassesForToolTypes
		  at: SpkCompilationErrorTool put: SpkCompilationErrorServiceServer;
		  at: SpkDebuggerTool put: SpkDebuggerServiceServer;
		  at: SpkDebuggerFrameTool put: SpkDebuggerFrameServiceServer;
		  at: SpkExplorerTool put: SpkExplorerServiceServer;
		  at: SpkInspectorRawViewTool put: SpkInspectorRawViewServiceServer;
		  at: SpkInspectorSetViewTool put: SpkInspectorSetViewServiceServer;
		  at: SpkInspectorTool put: SpkInspectorServiceServer;
		  at: SpkProcessListTool put: SpkProcessListServiceServer;
		  at: SpkProcessTerminatedTool
		  put: SpkProcessTerminatedServiceServer;
		  at: SpkProcessTool put: SpkProcessServiceServer;
		  at: SpkRuntimeErrorTool put: SpkRuntimeErrorServiceServer;
		  at: SpkSuccessTool put: SpkSuccessServiceServer;
		  at: SpkTaskspaceTool put: SpkTaskspaceServiceServer;
		  at: SpkTonelDirectoryListTool
		  put: SpkTonelDirectoryListServiceServer;
		  yourself
]

{ #category : 'accessing' }
SpkServiceFactory class >> serviceClassForToolClass: aToolClass [

	^ self serviceClassesForToolTypes
		  at: aToolClass
		  ifAbsent: [
		  self error: 'Unrecognized tool class ' , aToolClass name ]
]

{ #category : 'accessing' }
SpkServiceFactory class >> serviceClassesForToolTypes [

	^ serviceClassesForToolTypes ifNil: [
		  self initializeServiceClassesForToolTypes ]
]

{ #category : 'accessing' }
SpkServiceFactory class >> serviceForTool: aTool [
	| serviceClass |
	serviceClass := self serviceClassForToolClass: aTool class.
	^ serviceClass new
		initializeFromTool: aTool;
		yourself
]
