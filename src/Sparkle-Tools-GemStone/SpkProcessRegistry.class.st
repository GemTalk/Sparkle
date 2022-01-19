"
Associates each GsProcess with its SpkProcessManager. Not all processes have managers.
A process acquires a manager by being launched by a Sparkle evaluation or by being debugged.

The purpose of the registry is to prevent Sparkle from attempting to manage a process through
more than one manager or debug it through more than one DebuggerTool.

The process is held ""weakly"" via ephemeron so that this will not keep processes alive much 
past their normal lifetime.
"
Class {
	#name : 'SpkProcessRegistry',
	#superclass : 'SpkObject',
	#instVars : [
		'map'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'initialization' }
SpkProcessRegistry >> initialize [
	super initialize.
	map := SpkThreadSafeDictionary new.
]

{ #category : 'accessing' }
SpkProcessRegistry >> managerOfProcess: aProcess ifAbsent: aBlock [
	"Answer the SpkProcessManager that manages aProcess,
	or the result of evaluating aBlock."

	^ map at: aProcess ifAbsent: aBlock
]

{ #category : 'accessing' }
SpkProcessRegistry >> registerManager: aProcessManager forProcess: aProcess [
	| key |
	key := SpkEphemeronKey on: aProcess mournAction: [ self removeKey: aProcess ].
	map
		at: key
		ifPresent: [ :existingMgr | self error: 'Registering same process more than once.' ]
		ifAbsentPut: [ aProcessManager ]
]
