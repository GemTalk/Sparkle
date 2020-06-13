Class {
	#name : 'SpkChatServer',
	#superclass : 'Object',
	#instVars : [
		'connection'
	],
	#category : 'Sparkle-GemStone'
}

{ #category : 'instance creation' }
SpkChatServer class >> run [
	self new launchServer
]

{ #category : 'actions' }
SpkChatServer >> launchServer [
	connection := RsrConnection acceptOn: self portNumber.
	connection waitUntilClose
]

{ #category : 'constants' }
SpkChatServer >> portNumber [
	^ 6842
]
