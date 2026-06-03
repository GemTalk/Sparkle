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

	| myTool |
	myTool := SpkStopwatchTool newInTaskspace:
		          self parent tool taskspaceTool.
	myTool explorerTool: self parent tool.
	self initializeFromTool: myTool
]

{ #category : 'initialization' }
SpkStopwatchServiceServer >> initializeFromTool: aTool [
	tool := aTool.
	tool
		when: SpkUpdateAnnouncement
		send: #'receiveUpdateAnnouncement:'
		to: self.
	self refreshFromTool
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> pause [

	tool pause
]

{ #category : 'as yet unclassified' }
SpkStopwatchServiceServer >> receiveUpdateAnnouncement: anUpdateAnnouncement [

	| promise |
	self refreshFromTool.
	promise := remoteSelf updateFromServer.
	promise when: [  ] catch: self defaultCatchBlock
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> redo [

	tool redo
]

{ #category : 'refreshing' }
SpkStopwatchServiceServer >> refreshFromTool [

	elapsedTimeString := tool elapsedTimeString.
	isRunning := tool isRunning
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> reset [

	tool reset
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> run [

	tool run
]

{ #category : 'remote actions' }
SpkStopwatchServiceServer >> undo [

	tool undo
]
