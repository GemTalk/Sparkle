Class {
	#name : 'SpkScaffoldingUnhandledException',
	#superclass : 'Exception',
	#instVars : [
		'service'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'instance creation' }
SpkScaffoldingUnhandledException class >> fromService: service signal: ex [
	^ self new
		service: service;
		signal: ex
]

{ #category : 'accessing' }
SpkScaffoldingUnhandledException >> connection [
	^ self service connection
]

{ #category : 'Handling' }
SpkScaffoldingUnhandledException >> defaultAction [
	"no handler? That means this is a process that has been forked, so it is a free radical process ... when resumed it will run off the end ... bring up a debugger"

	| theException mon debugProcess debuggerService |
	theException := self details.
	(theException isKindOf: self class)
		ifTrue: [ 
			| res |
			res := self _signalGciError.
			^ res == self
				ifTrue: [ nil ]
				ifFalse: [ res ]	"Answer nil to be consistent with resume
				unless GciContinueWith has provided a
				return value." ].
	debugProcess := GsProcess _current.
	mon := [ 
	GsProcess _current debugActionBlock: nil.	"any errors at this point should go straight to GCI"
	debuggerService := SpkScaffoldingDebuggerServiceServer new
		registerWith: self connection;
		openDebuggerOnClientForProcess: debugProcess exception: theException;
		yourself ] forkAt: Processor userInterruptPriority.	"methinks this process should have a nil debugActionBlock"
	debugProcess suspend.
	^ debuggerService resumptionValue	"likely that noone is waiting on this result"
]

{ #category : 'accessing' }
SpkScaffoldingUnhandledException >> service [
	^service
]

{ #category : 'accessing' }
SpkScaffoldingUnhandledException >> service: object [
	service := object
]
