Class {
	#name : 'SpkStopwatchServiceServer',
	#superclass : 'SpkStopwatchService',
	#traits : 'SpkTHierarchicalService',
	#classTraits : 'SpkTHierarchicalService classTrait',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'as yet unclassified' }
SpkStopwatchServiceServer >> createToolTree [

	tool := SpkStopwatchTool newInTaskspace:
		        self parent tool taskspaceTool.
	tool explorerTool: self parent tool
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> pause [

	tool pause
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> reset [

	tool reset
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> run [

	tool run
]

{ #category : 'local actions' }
SpkStopwatchServiceServer >> serverValuesChanged [

	| promise |
	elapsedTimeString := tool elapsedTimeString.
	isRunning := tool isRunning.
	promise := remoteSelf serverValuesChanged.
	promise when: [  ] catch: self defaultCatchBlock
]
