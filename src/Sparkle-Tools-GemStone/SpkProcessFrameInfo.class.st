"
I hold a snapshot of the state of one frame of a process at one point in time.
I should be created by sending #forProcess:level:.
"
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

{ #category : 'accessing' }
SpkProcessFrameInfo >> description [
	^ description ifNil: [ 'Frame not yet initialized' ]
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

{ #category : 'private' }
SpkProcessFrameInfo >> isBinaryCharacter: aCharacter [

	^ '+-\*~<>=|/&@%,?!' includes: aCharacter
]

{ #category : 'private' }
SpkProcessFrameInfo >> isDecimalDigitCharacter: aCharacter [

	^ '0123456789' includes: aCharacter
]

{ #category : 'private' }
SpkProcessFrameInfo >> isKeywordCharacter: aCharacter [
	^ (aCharacter = $: or: [ self isKeywordStartCharacter: aCharacter ])
		or: [ self isDecimalDigitCharacter: aCharacter ]
]

{ #category : 'private' }
SpkProcessFrameInfo >> isKeywordStartCharacter: aCharacter [

	^ '_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' includes: aCharacter
]

{ #category : 'private' }
SpkProcessFrameInfo >> lastBinaryCharacterIn: source startingAt: startPos [
	"If source at: startPos is not a binary character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isBinaryCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ]
]

{ #category : 'private' }
SpkProcessFrameInfo >> lastDecimalDigitCharacterIn: source startingAt: startPos [
	"If source at: startPos is not a numeric character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isDecimalDigitCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ]
]

{ #category : 'private' }
SpkProcessFrameInfo >> lastKeywordCharacterIn: source startingAt: startPos [
	"If source at: startPos is not a keyword character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isKeywordCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ].
	"Reached the end of the method."
	^ source size
]

{ #category : 'accessing' }
SpkProcessFrameInfo >> level [
	^ level
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
SpkProcessFrameInfo >> source [
	"Return the source code of the associated method.
	If there is no method, empty string."

	^self method
		ifNil: ['']
		ifNotNil: [:method | method sourceString]
]

{ #category : 'accessing' }
SpkProcessFrameInfo >> sourceInterval [
	| method stepPoint startPos startChar source |
	method := self method.
	stepPoint := self stepPoint.
	method == nil
		ifTrue: [ ^ 1 to: 0 ].
	source := self source.
	stepPoint == nil
		ifTrue: [ ^ 1 to: (1 min: source size) ].
	startPos := method _sourceOffsetsAt: stepPoint.
	startChar := source at: startPos.	"Point at the last character of the source if we are at the end of the method w/o explicit return."
	startPos > source size
		ifTrue: [ ^ source size to: source size ].	"Explicit return"
	startChar = $^
		ifTrue: [ ^ startPos to: startPos ].	"Assignment, assume = follows :"
	startChar = $:
		ifTrue: [ ^ startPos to: startPos + 1 ].	"Binary selector"
	(self isBinaryCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastBinaryCharacterIn: source startingAt: startPos) ].	"Unary or keyword selector"
	(self isKeywordStartCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastKeywordCharacterIn: source startingAt: startPos) ].	"Primitive number"
	(self isDecimalDigitCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastDecimalDigitCharacterIn: source startingAt: startPos) ].	"Should not get here, but just in case we've missed a possibility..."
	^ startPos to: startPos
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
