Class {
	#name : 'SpkExplorerServiceServer',
	#superclass : 'SpkExplorerService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkExplorerServiceServer >> defaultLayout [

	^ SpkExplorerLayoutServiceServer new
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> initializeFromTool: aTool [
	tool := aTool.
	self refreshFromTool
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> refreshFromTool [
]

{ #category : 'accessing' }
SpkExplorerServiceServer >> tool [

	^ tool
]
