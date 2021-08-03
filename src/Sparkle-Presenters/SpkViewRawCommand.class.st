"
Set the inspector to a raw view of the fields
"
Class {
	#name : 'SpkViewRawCommand',
	#superclass : 'SpToolCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'default' }
SpkViewRawCommand class >> defaultDescription [

	^'Display the object''s instance variables directly'
]

{ #category : 'default' }
SpkViewRawCommand class >> defaultName [

	^ 'Raw'
]

{ #category : 'executing' }
SpkViewRawCommand >> execute [

	"Do nothing, raw view is the only available view right now"

	
]
