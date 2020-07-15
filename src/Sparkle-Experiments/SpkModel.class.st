"
Generic functionality of having an announcer and sending announcements.
One could also have an SpkRsrModel that subclassed from RsrService.
"
Class {
	#name : 'SpkModel',
	#superclass : 'Object',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#instVars : [
		'announcer'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'private' }
SpkModel >> _announcer [
	"Private"

	^ announcer
]

{ #category : 'private' }
SpkModel >> _announcer: anObject [
	"Private"

	^ announcer := anObject
]
