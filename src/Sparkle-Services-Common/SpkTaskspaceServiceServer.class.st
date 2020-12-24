Class {
	#name : 'SpkTaskspaceServiceServer',
	#superclass : 'SpkTaskspaceService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'as yet unclassified' }
SpkTaskspaceServiceServer class >> forTool: aTaskspaceTool [

	^ self new
		  tool: aTaskspaceTool;
		  yourself
]

{ #category : 'initialization' }
SpkTaskspaceServiceServer >> tool: aTaskspaceTool [

	tool := aTaskspaceTool
]
