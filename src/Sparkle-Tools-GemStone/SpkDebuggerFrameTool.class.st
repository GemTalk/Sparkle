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

{ #category : 'accessing' }
SpkDebuggerFrameTool >> currentSourceInterval [
	| startPos startChar source |
	source := self source.
	startPos := self method _sourceOffsetsAt: self stepPoint.
	startChar := self source at: startPos.	
	"Space for implicit return at end of method."
	startChar = $ 
		ifTrue: [ ^ startPos to: startPos ].	
	"Explicit return"
	startChar = $^
		ifTrue: [ ^ startPos to: startPos ].	
	"Assignment, assume = follows :"
	startChar = $:
		ifTrue: [ ^ startPos to: startPos + 1 ].	
	"Binary selector"
	(self isBinaryCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastBinaryCharacterIn: source startingAt: startPos) ].
	"Unary or keyword selector"
	(self isKeywordStartCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastKeywordCharacterIn: source startingAt: startPos) ].
	"Primitive number"
	(self isDecimalDigitCharacter: startChar)
		ifTrue: [ ^ startPos to: (self lastDecimalDigitCharacterIn: source startingAt: startPos) ].
	"Should not get here, but just in case we've missed a possibility..."
	^ startPos to: startPos
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> description [
	^ description ifNil: [ self initializeDescription ]
]

{ #category : 'private' }
SpkDebuggerFrameTool >> frameContents [
	^ frameContents
		ifNil: [ 
			(frameContents := process _frameContentsAt: level)
				ifNil: [ 
					self
						error:
							'Internal error -- nil frame contents for frame ' , level printString ] ]
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

{ #category : 'private' }
SpkDebuggerFrameTool >> isBinaryCharacter: aCharacter [

	^ '+-\*~<>=|/&@%,?!' includes: aCharacter
]

{ #category : 'private' }
SpkDebuggerFrameTool >> isDecimalDigitCharacter: aCharacter [

	^ '0123456789' includes: aCharacter
]

{ #category : 'private' }
SpkDebuggerFrameTool >> isKeywordCharacter: aCharacter [
	^ (aCharacter = $: or: [ self isKeywordStartCharacter: aCharacter ])
		or: [ self isDecimalDigitCharacter: aCharacter ]
]

{ #category : 'private' }
SpkDebuggerFrameTool >> isKeywordStartCharacter: aCharacter [

	^ '_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' includes: aCharacter
]

{ #category : 'private' }
SpkDebuggerFrameTool >> lastBinaryCharacterIn: source startingAt: startPos [
	"If source at: startPos is not a binary character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isBinaryCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ]
]

{ #category : 'private' }
SpkDebuggerFrameTool >> lastDecimalDigitCharacterIn: source startingAt: startPos [
	"If source at: startPos is not a numeric character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isDecimalDigitCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ]
]

{ #category : 'private' }
SpkDebuggerFrameTool >> lastKeywordCharacterIn: source startingAt: startPos [
	"If source at: startPos is not a keyword character, startPos - 1 will be returned"

	startPos to: source size do: [ :testPos | 
		(self isKeywordCharacter: (source at: testPos))
			ifFalse: [ ^ testPos - 1 ] ]
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
	"Append a space that can be highlighted when at an implicit return self."

	^ self method sourceString , ' '
]

{ #category : 'accessing' }
SpkDebuggerFrameTool >> stepPoint [
	| method |
	method := self method.
	^ method == method homeMethod
		ifTrue: [ process _stepPointAt: level ]
		ifFalse: [ method homeMethod _stepPointForMeth: method ip: (frameContents at: 2) ]
]
