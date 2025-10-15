"
Adds to SharedQueue functionality the ability to synchronize larger critical sections around 
operations of the queue.

new message #critical: evaluates a given block, and no other thread can do queue operations until that block exits.
"
Class {
	#name : 'SpkSharedQueue',
	#superclass : 'SharedQueue',
	#category : 'Sparkle-Application',
	#package : 'Sparkle-Application'
}

{ #category : 'mutual exclusion' }
SpkSharedQueue >> critical: aBlock [

	^ monitor critical: aBlock
]
