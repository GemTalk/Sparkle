Class {
	#name : 'SpkStopwatchTool',
	#superclass : 'SpkObject',
	#instVars : [
		'service',
		'explorerTool',
		'elapsedTime',
		'startUsec',
		'task',
		'previousStop'
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

{ #category : 'private' }
SpkStopwatchTool >> notifyService [

	service elapsedTimeChanged
]

{ #category : 'actions' }
SpkStopwatchTool >> reset [

	self stop.
	elapsedTime := Duration zero.
	self notifyService
]

{ #category : 'actions' }
SpkStopwatchTool >> start [

	startUsec := self currentUsec.
	task := [ self updateLoop ] forkAt: Processor userSchedulingPriority
]

{ #category : 'actions' }
SpkStopwatchTool >> stop [

	task ifNotNil: [ :t | t terminate ].
	task := nil.
	previousStop := elapsedTime
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
