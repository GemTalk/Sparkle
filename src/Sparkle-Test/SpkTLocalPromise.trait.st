Trait {
	#name : 'SpkTLocalPromise',
	#category : 'Sparkle-Test'
}

{ #category : 'as yet unclassified' }
SpkTLocalPromise >> promiseFor: aBlock [

	"Answer a promise for the result of the block. The block will be evaluated in a new thread.
	To simulate a server round-trip, wait a bit before evaluating the block and resolving the promise."

	| promise |
	promise := RsrPromise new.
	[ 
	| result |
	(Delay forMilliseconds: 50) wait.
	[ result := aBlock value ]
		on: Error
		do: [ :ex | promise break: ex description ].
	promise isResolved ifFalse: [ promise fulfill: result ] ] fork.
	^ promise
]
