Class {
	#name : 'SpkDebuggerFrameTool',
	#superclass : 'SpkTool',
	#instVars : [
		'process',
		'level',
		'frameContents',
		'description'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkDebuggerFrameTool >> description [
	^ description ifNil: [ self initializeDescription ]
]

{ #category : 'private' }
SpkDebuggerFrameTool >> frameContents [
	^ frameContents ifNil: [ frameContents := process _frameContentsAt: level ]
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
