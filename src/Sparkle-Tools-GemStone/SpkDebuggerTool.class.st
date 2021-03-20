Class {
	#name : 'SpkDebuggerTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'processManager',
		'process',
		'exception',
		'frames',
		'mustInitiate',
		'updatedInspectors'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkDebuggerTool >> currentException: anException [
	"Stepping does not update the exception. 
	Proceed and terminate set to nil, so we will re-initialize."
	exception ifNil: [ exception := anException ]
]

{ #category : 'private' }
SpkDebuggerTool >> debug [
	mustInitiate
		ifFalse: [ processManager returnValue: self ]
		ifTrue: [ self error: 'Debugging forked processes not yet fully implemented.' ]
]

{ #category : 'accessing' }
SpkDebuggerTool >> exceptionDescription [
	| string |
	string := String new.
	string
		add: exception class name;
		add: self exceptionSpecificMessage.
	^ string
]

{ #category : 'private' }
SpkDebuggerTool >> exceptionSpecificMessage [
	| fullMessage commaIndex latterPart |
	fullMessage := exception buildMessageText.
	fullMessage ifNil: [ ^ '' ].
	commaIndex := fullMessage indexOf: $,.
	latterPart := commaIndex = 0
		ifTrue: [ fullMessage ]
		ifFalse: [ fullMessage copyFrom: commaIndex + 1 to: fullMessage size ].
	^ ' - ' , latterPart
]

{ #category : 'accessing' }
SpkDebuggerTool >> explorerTool [
	^explorerTool
]

{ #category : 'accessing' }
SpkDebuggerTool >> explorerTool: object [
	explorerTool := object.
	explorerTool addPane: self
]

{ #category : 'accessing' }
SpkDebuggerTool >> frameAt: anInteger [
	^ self frames at: anInteger
]

{ #category : 'accessing' }
SpkDebuggerTool >> frames [
	^ frames
]

{ #category : 'initialization' }
SpkDebuggerTool >> initialize [
	super initialize.
	updatedInspectors := Set new.
	frames := #()
]

{ #category : 'initialization' }
SpkDebuggerTool >> initializeFramesFromProcess [
	| stackDepth |
	stackDepth := process stackDepth.
	frames := Array new: process stackDepth.
	1 to: stackDepth do: [:level | 
		| frame index |
		index := stackDepth - level + 1.
		frame := self newDebuggerFrameTool.
		frame
			level: level;
			index: index.
		frames at: index put: frame].
	^ frames
]

{ #category : 'accessing' }
SpkDebuggerTool >> mustInitiate: object [
	mustInitiate := object
]

{ #category : 'accessing' }
SpkDebuggerTool >> newDebuggerFrameTool [
	"Create and initialize a new DebuggerFrameTool instance."

	^SpkDebuggerFrameTool new
		explorerTool: explorerTool;
		process: process;
		yourself
]

{ #category : 'actions' }
SpkDebuggerTool >> proceed [
	"May wait for an answer, depending on whether the process is an evaluation process"

	| resultTool | 
	exception := nil. "If we hit another exception, we want the exception to be updated."
	resultTool := processManager proceedProcess.
	updatedInspectors := Set new.
	taskspaceTool announceExecutionWithUpdatedInspectors: updatedInspectors.
	^resultTool
]

{ #category : 'accessing' }
SpkDebuggerTool >> process [

	^ process
]

{ #category : 'accessing' }
SpkDebuggerTool >> process: aProcess [
	"The GsProcess that I am to debug."

	process := aProcess
]

{ #category : 'accessing' }
SpkDebuggerTool >> processIdentifier [
	^ SpkReflection identifierOf: process
]

{ #category : 'accessing' }
SpkDebuggerTool >> processManager: object [
	processManager := object
]

{ #category : 'accessing' }
SpkDebuggerTool >> processName [
	^ process name
]

{ #category : 'accessing' }
SpkDebuggerTool >> processPriority [
	^ process priority
]

{ #category : 'initialization' }
SpkDebuggerTool >> refreshFromProcess [
	| stackDepth oldFrames |
	stackDepth := process stackDepth.
	frames := Array new: process stackDepth.
	1 to: stackDepth do: [:level | 
		| frame index |
		index := stackDepth - level + 1.
		frame := self newDebuggerFrameTool.
		frame
			level: level;
			index: index.
		frames at: index put: frame].
	^ frames
]

{ #category : 'actions' }
SpkDebuggerTool >> terminate [
	exception := nil.	"If we hit another exception, we want the exception to be updated."
	process terminate.
	updatedInspectors := Set new.
	taskspaceTool announceExecutionWithUpdatedInspectors: updatedInspectors
]

{ #category : 'accessing' }
SpkDebuggerTool >> updatedInspectors [
	"The set of updated Inspector Services that have changed."

	^updatedInspectors
]
