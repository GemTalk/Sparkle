Class {
	#name : 'SpkTextServiceServer',
	#superclass : 'SpkTextService',
	#instVars : [
		'stdout'
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

{ #category : 'initialization' }
SpkTextServiceServer >> initialize [
	super initialize.
	stdout := GsFile stdoutServer
]
