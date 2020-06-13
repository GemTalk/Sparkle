Class {
	#name : 'SpkTextServiceServer',
	#superclass : 'SpkTextService',
	#instVars : [
		'stdout',
		'isClosing'
	],
	#category : 'Sparkle-GemStone'
}

{ #category : 'accessing' }
SpkTextServiceServer >> changed: anAspect [
	"Only aspect is #text at this point, so assume that's what it is."

	stdout
		nextPutAll: self string;
		cr
]

{ #category : 'events' }
SpkTextServiceServer >> closeRequestedRemotely [
	isClosing
		ifTrue: [ ^ self ].
	isClosing := true.
	stdout
		cr;
		nextPutAll: '==========Bye!==========';
		cr
]

{ #category : 'initialization' }
SpkTextServiceServer >> initialize [
	super initialize.
	isClosing := false.
	stdout := GsFile stdoutServer
]
