Class {
	#name : 'SpkStopwatchServiceClient',
	#superclass : 'SpkStopwatchService',
	#traits : 'SpkTHierarchicalService',
	#classTraits : 'SpkTHierarchicalService classTrait',
	#instVars : [
		'presenter'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'local actions' }
SpkStopwatchServiceClient >> reset [

	| promise |
	promise := remoteSelf reset.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'local actions' }
SpkStopwatchServiceClient >> start [

	| promise |
	promise := remoteSelf start.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'local actions' }
SpkStopwatchServiceClient >> stop [

	| promise |
	promise := remoteSelf stop.
	promise when: [  ] catch: self defaultCatchBlock
]
