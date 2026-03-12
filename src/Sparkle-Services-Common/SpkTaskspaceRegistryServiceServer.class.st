Class {
	#name : 'SpkTaskspaceRegistryServiceServer',
	#superclass : 'SpkTaskspaceRegistryService',
	#category : 'Sparkle-Services-Common-Services',
	#package : 'Sparkle-Services-Common',
	#tag : 'Services'
}

{ #category : 'defaults' }
SpkTaskspaceRegistryServiceServer >> newTaskspace [
	"Create a new taskspace tool, and answer a service for it."

	| tTool |
	tTool := SpkTaskspaceTool new.
	^ SpkServiceFactory serviceForTool: tTool
]
