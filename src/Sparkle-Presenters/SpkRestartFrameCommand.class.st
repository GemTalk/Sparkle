Class {
	#name : 'SpkRestartFrameCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'defaults' }
SpkRestartFrameCommand class >> defaultDescription [

	^'Restart the current frame (without processing unwind blocks)'
]

{ #category : 'defaults' }
SpkRestartFrameCommand class >> defaultIconName [

	^ #restart28
]

{ #category : 'defaults' }
SpkRestartFrameCommand class >> defaultName [

	^ 'Restart frame'
]

{ #category : 'executing' }
SpkRestartFrameCommand >> execute [

	self context restart
]
