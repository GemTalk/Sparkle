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
	[ 
	connection := RsrAcceptConnection host: '0.0.0.0' port: self portNumber.
	connection waitForConnection.
	true ] whileTrue: [ connection waitForConnection ]
]

{ #category : 'constants' }
SpkChatServer >> portNumber [
	^ 29299
]
