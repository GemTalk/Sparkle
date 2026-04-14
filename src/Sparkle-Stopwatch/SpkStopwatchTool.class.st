Class {
	#name : 'SpkStopwatchTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'task',
		'state',
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
	state isRunning: false
]

{ #category : 'actions' }
SpkStopwatchTool >> _reset [
	"Reset the stopwatch to zero elapsed time,
	but do not change whether it is running."

	state
		startTime: DateAndTime now;
		elapsedDuration: Duration zero
]

{ #category : 'private actions' }
SpkStopwatchTool >> _run [
	"Private. Start the stopwatch running, from the point it was last stopped."

	state startTime: DateAndTime now - state elapsedDuration.
	self _startRunning
]

{ #category : 'private actions' }
SpkStopwatchTool >> _startRunning [
	"Private. Start the stopwatch running, from its existing state."

	state isRunning: true.
	self startUpdating.
	self announceUpdate
]

{ #category : 'actions' }
SpkStopwatchTool >> _updated [
	"My state been updated. Re-cache time string 
	and let any subscribers know they should refresh."

	self
		updateElapsedTimeString;
		announceUpdate
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
	state := SpkStopwatchState new.
	self updateElapsedTimeString
]

{ #category : 'testing' }
SpkStopwatchTool >> isRunning [

	^ state isRunning
]

{ #category : 'actions' }
SpkStopwatchTool >> pause [
	"Stop the stopwatch at its current time."

	| action |
	self isRunning ifFalse: [ ^ self ]. "Ignore if already paused"
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

	| action |
	action := SpkStopwatchResetAction forTarget: self.
	explorerTool performAction: action
]

{ #category : 'actions' }
SpkStopwatchTool >> run [
	"Start the stopwatch running, from the point it was last stopped."

	| action |
	self isRunning ifTrue: [ ^ self ]. "Ignore if already running"
	action := SpkStopwatchRunAction forTarget: self.
	explorerTool performAction: action
]

{ #category : 'private' }
SpkStopwatchTool >> startUpdating [

	task := [ self updateLoop ] forkAt: Processor userSchedulingPriority.
	task name: 'Stopwatch updateLoop'
]

{ #category : 'accessing' }
SpkStopwatchTool >> state [

	^ state
]

{ #category : 'accessing' }
SpkStopwatchTool >> state: aStopwatchState [

	state := aStopwatchState.
	self
		updateElapsedTimeString;
		announceUpdate
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

	state elapsedDuration: DateAndTime now - state startTime.
	self updateElapsedTimeString
]

{ #category : 'private' }
SpkStopwatchTool >> updateElapsedTimeString [

	| stream t m s tenths |
	stream := WriteStream on: (String new: 7).
	t := state elapsedDuration. "snapshot elapsedTime, which could change during this method."
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
	self isRunning ] whileTrue.
	task := nil
]
