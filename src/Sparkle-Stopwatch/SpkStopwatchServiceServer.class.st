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

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> reset [

	tool reset
]

{ #category : 'local actions' }
SpkStopwatchServiceServer >> serverValuesChanged [

	| promise |
	elapsedTimeString := tool elapsedTimeString.
	isRunning := tool isRunning.
	promise := remoteSelf serverValuesChanged.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> start [

	tool start
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> stop [

	tool stop
]
