Class {
	#name : 'SpkStopwatchTool',
	#superclass : 'SpkObject',
	#instVars : [
		'service',
		'explorerTool',
		'elapsedTime',
		'startUsec',
		'task',
		'previousStop',
		'isRunning'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'private' }
SpkStopwatchTool >> currentUsec [

	^ Time primUTCMicrosecondsClock
]

{ #category : 'accessing' }
SpkStopwatchTool >> elapsedTimeString [

	| stream t h m s tenths |
	stream := WriteStream on: (String new: 10).
	t := elapsedTime. "snapshot elapsedTime, which could change during this method."
	h := t hours.
	m := t minutes.
	s := t seconds.
	tenths := t nanoSeconds // 100000000.
	h printOn: stream base: 10 nDigits: 2.
	stream << ':'.
	m printOn: stream base: 10 nDigits: 2.
	s printOn: stream base: 10 nDigits: 2.
	stream << '.'.
	tenths printOn: stream.
	^ stream contents
]

{ #category : 'initialization' }
SpkStopwatchTool >> initialize [

	super initialize.
	elapsedTime := previousStop := Duration zero
]

{ #category : 'testing' }
SpkStopwatchTool >> isRunning [

	^ isRunning
]

{ #category : 'private' }
SpkStopwatchTool >> notifyService [

	service serverValuesChanged
]

{ #category : 'actions' }
SpkStopwatchTool >> reset [
	"Reset the stopwatch to zero and leave it stopped."

	self stop.
	elapsedTime := Duration zero.
	self notifyService
]

{ #category : 'actions' }
SpkStopwatchTool >> start [
	"Start the stopwatch running"

	startUsec := self currentUsec.
	self startUpdating.
	isRunning := true.
	self notifyService
]

{ #category : 'actions' }
SpkStopwatchTool >> startUpdating [

	task := [ self updateLoop ] forkAt: Processor userSchedulingPriority
]

{ #category : 'actions' }
SpkStopwatchTool >> stop [
	"Stop the stopwatch at its current time."

	self stopUpdating.
	previousStop := elapsedTime.
	isRunning := false.
	self notifyService
]

{ #category : 'actions' }
SpkStopwatchTool >> stopUpdating [

	| t |
	t := task.
	task := nil.
	t ifNotNil: [ t terminate ]
]

{ #category : 'private' }
SpkStopwatchTool >> updateElapsedTime [

	| usec |
	usec := self currentUsec.
	elapsedTime := previousStop + (Duration microSeconds: usec - startUsec)
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
	newString = oldString ifFalse: [ self notifyService ] ] whileTrue
]
