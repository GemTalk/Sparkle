Class {
	#name : 'SpkStopwatchTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'task',
		'previousStop',
		'isRunning',
		'elapsedDuration',
		'startTime',
		'elapsedTimeString'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'accessing' }
SpkStopwatchTool >> buildElapsedTimeString [

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
	^ stream contents
]

{ #category : 'private' }
SpkStopwatchTool >> currentUsec [

	^ Time primUTCMicrosecondsClock
]

{ #category : 'accessing' }
SpkStopwatchTool >> elapsedTimeString [

	^ elapsedTimeString
]

{ #category : 'accessing' }
SpkStopwatchTool >> elapsedTimeString: anObject [

	elapsedTimeString := anObject
]

{ #category : 'accessing' }
SpkStopwatchTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'initialization' }
SpkStopwatchTool >> initialize [

	super initialize.
	isRunning := false.
	startTime := DateAndTime now.
	elapsedDuration := Duration zero.
	elapsedTimeString := self buildElapsedTimeString
]

{ #category : 'testing' }
SpkStopwatchTool >> isRunning [

	^ isRunning
]

{ #category : 'private' }
SpkStopwatchTool >> notifyService [

	self announceUpdate
]

{ #category : 'actions' }
SpkStopwatchTool >> pause [
	"Stop the stopwatch at its current time."

	self stopUpdating.
	previousStop := elapsedDuration.
	isRunning := false
]

{ #category : 'actions' }
SpkStopwatchTool >> reset [
	"Reset the stopwatch to zero and leave it stopped."

	self pause.
	elapsedDuration := Duration zero.

]

{ #category : 'actions' }
SpkStopwatchTool >> run [
	"Start the stopwatch running, from the point it was last stopped."

	startTime := DateAndTime now - elapsedDuration.
	self startUpdating.
	isRunning := true
]

{ #category : 'actions' }
SpkStopwatchTool >> startUpdating [

	task := [ self updateLoop ] forkAt: Processor userSchedulingPriority.
	task name: 'Stopwatch updateLoop'
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

	elapsedDuration := DateAndTime now - startTime.
	elapsedTimeString := self buildElapsedTimeString
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
	isRunning ] whileTrue
]
