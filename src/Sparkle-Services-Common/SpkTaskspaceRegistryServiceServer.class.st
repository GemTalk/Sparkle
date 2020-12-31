Class {
	#name : 'SpkTaskspaceRegistryServiceServer',
	#superclass : 'SpkTaskspaceRegistryService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'defaults' }
SpkTaskspaceRegistryServiceServer >> newDefaultTaskspaceLayout [

	"Create a new default taskspace layout tool, and answer a service for it."

	| tool |
	tool := SpkTaskspaceLayoutTool newDefault.
	^ SpkTaskspaceLayoutServiceServer forTool: tool
]
