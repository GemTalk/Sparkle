Class {
	#name : 'SpkTaskspaceRegistryServiceServer',
	#superclass : 'SpkTaskspaceRegistryService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'defaults' }
SpkTaskspaceRegistryServiceServer >> defaultTaskspaceService [

	"Create a new default taskspace tool, and answer a service for it."

	| tool |
	self flag: 'Obsolete method'.
	tool := SpkTaskspaceTool newDefault.
	^ SpkTaskspaceServiceServer forTool: tool
]

{ #category : 'defaults' }
SpkTaskspaceRegistryServiceServer >> newDefaultTaskspaceLayout [

	"Create a new default taskspace layout tool, and answer a service for it."

	| tool |
	tool := SpkTaskspaceLayoutTool newDefault.
	^ SpkTaskspaceLayoutServiceServer forTool: tool
]
