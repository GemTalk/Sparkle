"
When used by a test service, simulates a send to remoteSelf.
"
Trait {
	#name : 'SpkTLocalPromise',
	#category : 'Sparkle-Test-Pharo Unit Tests'
}

{ #category : 'promising' }
SpkTLocalPromise >> promiseFor: aBlock [

	"Answer a promise for the result of the block. The block will be evaluated in a new thread.
	To simulate a server round-trip, wait a bit before evaluating the block and resolving the promise."

	| promise |
	promise := RsrPromise new.
	[ 
	(Delay forMilliseconds: 50) wait.
	[ promise fulfill: aBlock value ]
		on: Error
		do: [ :ex | promise break: ex description ] ] fork.
	^ promise
]
