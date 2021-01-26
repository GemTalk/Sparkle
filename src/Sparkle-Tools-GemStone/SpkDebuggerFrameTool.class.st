"
I represent and manipulate a single stack frame within a GsProcess (#process)
#level is my position in the stack using the GsProcess numbering system, where level 1 is the top frame of the stack.
#index is my position in the Sparkle numbering system, where index 1 is the *bottom* frame of the stack.
The Sparkle numbering system allows my index to stay the same during stepping, when the number of frames above me may change, changing my #level.
"
Class {
	#name : 'SpkDebuggerFrameTool',
	#superclass : 'SpkTool',
	#instVars : [
		'process',
		'level',
		'frameContents',
		'description',
		'index'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'other' }
SpkDebuggerFrameTool >> currentSourceInterval [
	| start |
	start := self method _sourceOffsetsAt: self stepPoint.
	start >= self source size
		ifTrue: [ start := start - 1 ].
	^ start to: start + 1
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> description [
	^ description ifNil: [ self initializeDescription ]
]

{ #category : 'private' }
SpkDebuggerFrameTool >> frameContents [
	^ frameContents ifNil: [ frameContents := process _frameContentsAt: level ]
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> index [
	^index
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> index: object [
	index := object
]

{ #category : 'private' }
SpkDebuggerFrameTool >> initializeDescription [
	| meth receiver |
	meth := self method.
	receiver := process _receiverInFrameContents: self frameContents.
	description := meth _descrForStackPadTo: 0 rcvr: receiver.
	^ description
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> level: anInteger [
	level := anInteger
]

{ #category : 'private' }
SpkDebuggerFrameTool >> method [
	^ process _methodInFrameContents: self frameContents
]

{ #category : 'printing' }
SpkDebuggerFrameTool >> printOn: aStream [
	level isNil | process isNil
		ifTrue: [ ^ super printOn: aStream ].
	aStream nextPutAll: self description
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> process: aProcess [
	process := aProcess
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> source [
	^ self method sourceString
]

{ #category : 'other' }
SpkDebuggerFrameTool >> stepPoint [
	| method |
	method := self method.
	^ method == method homeMethod
		ifTrue: [ process _stepPointAt: level ]
		ifFalse: [ method homeMethod _stepPointForMeth: method ip: (frameContents at: 2) ]
]
