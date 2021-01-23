"
I represent and manipulate a single stack frame within a GsProcess (#process)
#level is my position in the stack using the GsProcess numbering system, where level 1 is the top frame of the stack.
#index is my position in the Sparkle numbering system, where index 1 is the *bottom* frame of the stack.
The Sparkle numbering system allows my index to stay the same during stepping, when the number of frames above me may change, changing my #level.
"
Class {
	#name : 'SpkDebuggerFrameDescriptionTool',
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

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionTool >> description [
	^ description ifNil: [ self initializeDescription ]
]

{ #category : 'private' }
SpkDebuggerFrameDescriptionTool >> frameContents [
	^ frameContents ifNil: [ frameContents := process _frameContentsAt: level ]
]

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionTool >> index [
	^index
]

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionTool >> index: object [
	index := object
]

{ #category : 'private' }
SpkDebuggerFrameDescriptionTool >> initializeDescription [
	| meth receiver |
	meth := self method.
	receiver := process _receiverInFrameContents: self frameContents.
	description := meth _descrForStackPadTo: 0 rcvr: receiver.
	^ description
]

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionTool >> level: anInteger [
	level := anInteger
]

{ #category : 'private' }
SpkDebuggerFrameDescriptionTool >> method [
	^ process _methodInFrameContents: self frameContents
]

{ #category : 'printing' }
SpkDebuggerFrameDescriptionTool >> printOn: aStream [
	level isNil | process isNil
		ifTrue: [ ^ super printOn: aStream ].
	aStream nextPutAll: self description
]

{ #category : 'accessing' }
SpkDebuggerFrameDescriptionTool >> process: aProcess [
	process := aProcess
]
