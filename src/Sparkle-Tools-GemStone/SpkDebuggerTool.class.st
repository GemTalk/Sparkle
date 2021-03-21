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

{ #category : 'accessing' }
SpkDebuggerTool >> mustInitiate: object [
	mustInitiate := object
]

{ #category : 'accessing' }
SpkDebuggerTool >> newDebuggerFrameTool [
	"Create and initialize a new DebuggerFrameTool instance."

	^SpkDebuggerFrameTool new
		taskspaceTool: taskspaceTool;
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
SpkDebuggerTool >> refreshExistingFrames [
	"Update any frames at the bottom of the stack that still
	represent the same frame. Answerthe number of frames
	that are still valid.
	For a new debugger, frames size is 0."

	| numberOfValidFrames newStackDepth |
	numberOfValidFrames := 0.
	newStackDepth := process stackDepth.
	1 to: (frames size min: newStackDepth) do: [ :index | 
		| level frame |
		level := newStackDepth - index + 1.
		frame := frames at: index.
		frame refreshAtLevel: level.
		(frame methodHasChanged or: [ frame receiverHasChanged ])
			ifTrue: [ ^ numberOfValidFrames ].
		numberOfValidFrames := numberOfValidFrames + 1.
		frame stepPointHasChanged
			ifTrue: [ ^ numberOfValidFrames ] ].
	^ numberOfValidFrames
]

{ #category : 'initialization' }
SpkDebuggerTool >> refreshFromProcess [
	"Keep the FrameTools for any still-valid bottom portion of the stack.
	The service layer uses identity of frame tools to determine what needs refreshing."

	| numberOfValidFrames newStackDepth newFrames |
	numberOfValidFrames := self refreshExistingFrames.
	newStackDepth := process stackDepth.
	newFrames := Array new: newStackDepth.
	newFrames
		replaceFrom: 1
		to: numberOfValidFrames
		with: frames
		startingAt: 1.
	numberOfValidFrames + 1 to: newStackDepth do: [ :index | 
		| frame level |
		level := newStackDepth - index + 1.
		frame := self newDebuggerFrameTool.
		frame
			index: index;
			refreshAtLevel: level.
		newFrames at: index put: frame ].
	^ frames := newFrames
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
