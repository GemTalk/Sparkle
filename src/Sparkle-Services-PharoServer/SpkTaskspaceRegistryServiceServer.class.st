Class {
	#name : 'SpkTaskspaceRegistryServiceServer',
	#superclass : 'SpkTaskspaceRegistryService',
	#traits : 'SpkTDebugLocalServer',
	#classTraits : 'SpkTDebugLocalServer classTrait',
	#category : 'Sparkle-Services-PharoServer-Services'
}

{ #category : 'as yet unclassified' }
SpkTaskspaceRegistryServiceServer >> defaultTaskspaceService [

	"Create a new default taskspace tool, and answer a service for it."

	| tool |
	self flag: 'Obsolete method'.
	tool := SpkTaskspaceTool newDefault.
	^ SpkTaskspaceServiceServer forTool: tool
]

{ #category : 'as yet unclassified' }
SpkTaskspaceRegistryServiceServer >> newDefaultTaskspaceLayout [

	"Create a new default taskspace layout tool, and answer a service for it."

	| tool |
	tool := SpkTaskspaceLayoutTool newDefault.
	^ SpkTaskspaceLayoutServiceServer forTool: tool
]
