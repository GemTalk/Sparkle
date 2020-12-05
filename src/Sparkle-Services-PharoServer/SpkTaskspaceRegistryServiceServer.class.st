Class {
	#name : 'SpkTaskspaceRegistryServiceServer',
	#superclass : 'SpkTaskspaceRegistryService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#category : 'Sparkle-Services-PharoServer'
}

{ #category : 'as yet unclassified' }
SpkTaskspaceRegistryServiceServer >> defaultTaskspaceService [

	"Create a new default taskspace tool, and answer a service for it."

	| tool |
	tool := SpkTaskspaceTool newDefault.
	^ SpkTaskspaceServiceServer forTool: tool
]
