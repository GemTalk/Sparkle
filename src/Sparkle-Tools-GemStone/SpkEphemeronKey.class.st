"
An ephemeron suitable for use as a key in a weak-key dictionary.
Compares equal to (and hashes same as) the ephemeron's key.
"
Class {
	#name : 'SpkEphemeronKey',
	#superclass : 'RsrEphemeron',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'comparing' }
SpkEphemeronKey >> = anObject [
	^ self value = anObject value
]

{ #category : 'comparing' }
SpkEphemeronKey >> hash [
	^ key hash
]

{ #category : 'accessing' }
SpkEphemeronKey >> value [
	"Needed for implementation of #="

	^ key
]
