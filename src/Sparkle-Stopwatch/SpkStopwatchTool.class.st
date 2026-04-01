Class {
	#name : 'SpkStopwatchTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'task',
		'isRunning',
		'elapsedDuration',
		'startTime',
		'elapsedTimeString'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'private actions' }
SpkStopwatchTool >> _pause [
	"Private. Stop the stopwatch at its current time."

	self stopUpdating.
	isRunning := false.
	self announceUpdate
]

{ #category : 'private actions' }
SpkStopwatchTool >> _run [
	"Private. Start the stopwatch running, from the point it was last stopped."

	startTime := DateAndTime now - elapsedDuration.
	isRunning := true.
	self startUpdating.
	self announceUpdate
]

{ #category : 'accessing' }
SpkStopwatchTool >> elapsedDuration [

	^ elapsedDuration
]

{ #category : 'accessing' }
SpkStopwatchTool >> elapsedDuration: anObject [

	elapsedDuration := anObject
]

{ #category : 'accessing' }
SpkStopwatchTool >> elapsedTimeString [

	^ elapsedTimeString
]

{ #category : 'accessing' }
SpkStopwatchTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'initialization' }
SpkStopwatchTool >> initialize [

	super initialize.
	isRunning := false.
	self setStartTimeToNow.
	elapsedDuration := Duration zero.
	self updateElapsedTimeString
]

{ #category : 'testing' }
SpkStopwatchTool >> isRunning [

	^ isRunning
]

{ #category : 'accessing' }
SpkStopwatchTool >> isRunning: anObject [

	isRunning := anObject
]

{ #category : 'actions' }
SpkStopwatchTool >> pause [
	"Stop the stopwatch at its current time."

	| action |
	isRunning ifFalse: [ ^ self ]. "Ignore if already paused"
	action := SpkStopwatchPauseAction forTarget: self.
	explorerTool performAction: action
]

{ #category : 'actions' }
SpkStopwatchTool >> redo [
	"Make the previous undo, if any, like it never happened."

	explorerTool canRedo ifTrue: [ explorerTool redo ].
	self announceUpdate
]

{ #category : 'accessing' }
SpkStopwatchTool >> redoActionName [

	^ explorerTool redoActionName
]

{ #category : 'actions' }
SpkStopwatchTool >> reset [
	"Reset the stopwatch to zero elapsed time,
	but do not change whether it is running."

	self setStartTimeToNow.
	elapsedDuration := Duration zero.
	self
		updateElapsedTime;
		announceUpdate
]

{ #category : 'actions' }
SpkStopwatchTool >> run [
	"Start the stopwatch running, from the point it was last stopped."

	| action |
	isRunning ifTrue: [ ^ self ]. "Ignore if already running"
	action := SpkStopwatchRunAction forTarget: self.
	explorerTool performAction: action
]

{ #category : 'initialization' }
SpkStopwatchTool >> setStartTimeToNow [

	startTime := DateAndTime now
]

{ #category : 'accessing' }
SpkStopwatchTool >> startTime [

	^ startTime
]

{ #category : 'accessing' }
SpkStopwatchTool >> startTime: anObject [

	startTime := anObject
]

{ #category : 'private' }
SpkStopwatchTool >> startUpdating [

	task := [ self updateLoop ] forkAt: Processor userSchedulingPriority.
	task name: 'Stopwatch updateLoop'
]

{ #category : 'private' }
SpkStopwatchTool >> stopUpdating [

	| myTask |
	myTask := task. "Save in a temp in case task terminates and nils itself while we're doing this"
	task := nil.
	myTask ifNotNil: [ myTask terminate ]
]

{ #category : 'actions' }
SpkStopwatchTool >> undo [
	"Make the previous action, if any, like it never happened."

	explorerTool canUndo ifTrue: [ explorerTool undo ].
	self announceUpdate
]

{ #category : 'accessing' }
SpkStopwatchTool >> undoActionName [

	^ explorerTool undoActionName
]

{ #category : 'private' }
SpkStopwatchTool >> updateElapsedTime [

	elapsedDuration := DateAndTime now - startTime.
	self updateElapsedTimeString
]

{ #category : 'private' }
SpkStopwatchTool >> updateElapsedTimeString [

	| stream t m s tenths |
	stream := WriteStream on: (String new: 7).
	t := elapsedDuration. "snapshot elapsedTime, which could change during this method."
	m := t minutes.
	s := t seconds.
	tenths := t nanoSeconds // 100000000.
	m printOn: stream base: 10 nDigits: 2.
	stream << ':'.
	s printOn: stream base: 10 nDigits: 2.
	stream << '.'.
	tenths printOn: stream.
	elapsedTimeString := stream contents
]

{ #category : 'updateTask' }
SpkStopwatchTool >> updateLoop [
	"Every 50 mS update elapsedTime. If the update changes the string, notify our service."

	| oldString newString |
	newString := self elapsedTimeString.
	[
	oldString := newString.
	50 milliSeconds wait.
	self updateElapsedTime.
	newString := self elapsedTimeString.
	newString = oldString ifFalse: [ self announceUpdate ].
	isRunning ] whileTrue.
	task := nil
]
