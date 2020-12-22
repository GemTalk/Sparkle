Class {
	#name : 'GemToGemAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'signalMessage',
		'sessionSerialNum'
	],
	#classVars : [
		'RegisteredSessions',
		'Registry'
	],
	#category : 'Announcements-Core-GemStone'
}

{ #category : 'accessing' }
GemToGemAnnouncement class >> announcer [

	| ann |
	ann := SessionTemps current at: #GemToGemAnnouncement_Announcer otherwise: nil.
	ann == nil 
		ifTrue: [
			ann := Announcer new.
			SessionTemps current at: #GemToGemAnnouncement_Announcer put: ann].
	^ann
]

{ #category : 'announcing' }
GemToGemAnnouncement class >> broadcast [

	self new broadcast
]

{ #category : 'announcing' }
GemToGemAnnouncement class >> broadcastMessage: aString [

	(self new
		signalMessage: aString;
		yourself) broadcast
]

{ #category : 'registration' }
GemToGemAnnouncement class >> cleanRegisteredSessions [
	(self registeredSessions select: [ :each | ((System descriptionOfSessionSerialNum: each) at: 1) == nil ])
		do: [ :each | self registeredSessions remove: each ]
]

{ #category : 'initialization' }
GemToGemAnnouncement class >> initialize [
	"self initialize"
	
	RegisteredSessions := RcIdentityBag new: 100.
	Registry := Dictionary new.
	self allSubclasses do: [:cl | cl initialize].
]

{ #category : 'announcing' }
GemToGemAnnouncement class >> installStaticHandler [
  | handler |
  self registeredSessions add: GsCurrentSession currentSession serialNumber.
  handler := InterSessionSignal addDefaultHandler: [:ex |
     GemToGemAnnouncement signal: ex sentInt 
               message: ex sentMessage 
	      sessionSerialNum: ex sendingSession .
     System enableSignaledGemStoneSessionError .
     ex resume
  ].
  SessionTemps current at: #GemToGemStaticException put: handler.
  System enableSignaledGemStoneSessionError.

]

{ #category : 'accessing' }
GemToGemAnnouncement class >> registeredSessions [
	
	RegisteredSessions == nil ifTrue: [ RegisteredSessions := RcIdentityBag new: 100 ].
	^RegisteredSessions
]

{ #category : 'registration' }
GemToGemAnnouncement class >> registerForGemToGemSignalling [

	self registry at: self signalNumber put: self
]

{ #category : 'accessing' }
GemToGemAnnouncement class >> registry [

	Registry == nil ifTrue: [ Registry := Dictionary new ].
	^Registry
]

{ #category : 'instance creation' }
GemToGemAnnouncement class >> signal: aSignal message: aString sessionSerialNum: aSerialNumber [

	| cl  |
	cl := self registry at: aSignal ifAbsent: [ ^self ].
	self announcer announce: (cl new
		signalMessage: aString;
		sessionSerialNum: aSerialNumber;
		yourself)
]

{ #category : 'constants' }
GemToGemAnnouncement class >> signalNumber [

	^0
]

{ #category : 'testing' }
GemToGemAnnouncement class >> staticHandlerInstalled [

	^(SessionTemps current at: #GemToGemStaticException otherwise: nil) ~~ nil
]

{ #category : 'announcing' }
GemToGemAnnouncement class >> uninstallStaticHandler [

  | handler |
  self registeredSessions removeIfPresent: GsCurrentSession currentSession serialNumber.
  handler := SessionTemps current at: #GemToGemStaticException otherwise: nil.
  System disableSignaledGemStoneSessionError.
  handler ifNotNil: [ Exception removeStaticException: handler ].

]

{ #category : 'signalling' }
GemToGemAnnouncement >> broadcast [

	| badSerialNumbers |
	badSerialNumbers := Array new.
	self registeredSessions do: [:aSessionSerialNumber |
		[System _sendSignal: self signalNumber toSess: aSessionSerialNumber withMessage: self signalMessage]
			on: Error
			do: [:ex | 
				"Gem is no longer around or no longer listening"
				badSerialNumbers add: aSessionSerialNumber.
				ex return]].
	self registeredSessions removeAll: badSerialNumbers

]

{ #category : 'accessing' }
GemToGemAnnouncement >> registeredSessions [

	^self class registeredSessions
]

{ #category : 'signalling' }
GemToGemAnnouncement >> replyToSenderWithSignal: aSignalNumber message: aString [

	System 
		_sendSignal: aSignalNumber 
		toSess: sessionSerialNum 
		withMessage: aString

]

{ #category : 'accessing' }
GemToGemAnnouncement >> sessionSerialNum [

	^sessionSerialNum
]

{ #category : 'accessing' }
GemToGemAnnouncement >> sessionSerialNum: aSerialNumber [

	sessionSerialNum := aSerialNumber
]

{ #category : 'accessing' }
GemToGemAnnouncement >> signalMessage [

	signalMessage == nil ifTrue: [ signalMessage := '' ].
	^signalMessage
]

{ #category : 'accessing' }
GemToGemAnnouncement >> signalMessage: aString [

	aString size > 1023 ifTrue: [self error: 'message too large for Gem to Gem Signalling'].
	signalMessage := aString
]

{ #category : 'accessing' }
GemToGemAnnouncement >> signalNumber [

	^self class signalNumber
]
