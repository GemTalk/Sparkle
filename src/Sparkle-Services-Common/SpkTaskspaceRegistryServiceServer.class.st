Class {
	#name : 'SpkTaskspaceRegistryServiceServer',
	#superclass : 'SpkTaskspaceRegistryService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'defaults' }
SpkTaskspaceRegistryServiceServer >> newDefaultTaskspace [

	"Create a new default taskspace tool, and answer a service for it."

	| tool |
	tool := SpkTaskspaceTool newDefault.
	^ SpkServiceFactory serviceForTool: tool
]
