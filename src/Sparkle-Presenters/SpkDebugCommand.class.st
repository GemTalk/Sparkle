Class {
	#name : 'SpkDebugCommand',
	#superclass : 'SpAcceptChangesCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'default' }
SpkDebugCommand class >> defaultDescription [

	^'Debug the evaluator''s full text'
]

{ #category : 'default' }
SpkDebugCommand class >> defaultIconName [

	^ #smallDebug
]

{ #category : 'default' }
SpkDebugCommand class >> defaultName [

	^ 'Debug'
]

{ #category : 'default' }
SpkDebugCommand class >> defaultShortcutKey [

	^ nil
]

{ #category : 'executing' }
SpkDebugCommand >> execute [

	self context debug
]
