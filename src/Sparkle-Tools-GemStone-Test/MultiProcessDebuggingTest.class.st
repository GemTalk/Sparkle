"
Abstract class for tests of debugging operations that test interaction between multiple processes.

processes is a dictionary mapping Symbol IDs to processes. The ID is determined by the individual test.
"
Class {
	#name : 'MultiProcessDebuggingTest',
	#superclass : 'DebuggingTest',
	#instVars : [
		'processes'
	],
	#category : 'Sparkle-Tools-GemStone-Test'
}

{ #category : 'Testing' }
MultiProcessDebuggingTest class >> isAbstract [
	^ self sunitName = #'MultiProcessDebuggingTest'
]

{ #category : 'support - processes' }
MultiProcessDebuggingTest >> newProcessForBlock: aBlock id: id [
	| newProcess |
	(processes includesKey: id)
		ifTrue: [ self error: 'Process with ID ' , id printString , ' already exists' ].
	newProcess := super newProcessForBlock: aBlock id: id.
	processes at: id put: newProcess.
	^ newProcess
]

{ #category : 'support' }
MultiProcessDebuggingTest >> setUp [
	super setUp.
	processes := Dictionary new
]

{ #category : 'support' }
MultiProcessDebuggingTest >> tearDown [
	processes do: [ :each | each terminate ].
	processes := nil.
	super tearDown
]
