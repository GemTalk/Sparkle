Class {
	#name : 'SpkExplorerServiceServer',
	#superclass : 'SpkExplorerService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkExplorerServiceServer >> initializeFromTool: aTool [
	tool := aTool
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> tool [

	^ tool
]
