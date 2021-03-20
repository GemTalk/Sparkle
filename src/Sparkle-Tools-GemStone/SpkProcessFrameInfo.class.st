Class {
	#name : 'SpkProcessFrameInfo',
	#superclass : 'SpkObject',
	#instVars : [
		'frameContents',
		'level',
		'description',
		'isNativeStack',
		'calleeIsAsync'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'instance creation' }
SpkProcessFrameInfo class >> forProcess: aProcess level: aLevel [
	^ self new initializeForProcess: aProcess level: aLevel
]

{ #category : 'accessing' }
SpkProcessFrameInfo >> argAndTempNames [
	^ frameContents at: 9
]

{ #category : 'accessing' }
SpkProcessFrameInfo >> argAndTempValues [
	^ frameContents copyFrom: 11 to: frameContents size
]

{ #category : 'initialization' }
SpkProcessFrameInfo >> initializeDescription [
	| method |
	method := self method.
	method == nil
		ifTrue: [ ^ description := '<no method>' ].
	description := method _descrForStackPadTo: 0 rcvr: self receiver.
	^ description
]

{ #category : 'initialization' }
SpkProcessFrameInfo >> initializeForProcess: aProcess level: aLevel [
	level := aLevel.
	isNativeStack := aProcess _nativeStack.
	calleeIsAsync := aProcess _calleeIsAsync: level.
	(frameContents := aProcess _frameContentsAt: level)
		ifNil: [ 
			self
				error: 'Internal error -- nil frame contents for frame ' , level printString ].
	self initializeDescription
]

{ #category : 'accessing' }
SpkProcessFrameInfo >> method [
	^ frameContents at: 1
]

{ #category : 'accessing' }
SpkProcessFrameInfo >> receiver [
	^ frameContents at: 10
]

{ #category : 'accessing' }
SpkProcessFrameInfo >> stepPoint [
	| ip method |
	method := self method.
	method ifNil: [ ^ nil ].
	ip := (frameContents at: 2) abs.
	^ method
		_stepPointForIp: ip
		level: level
		useNext: isNativeStack | calleeIsAsync
]
