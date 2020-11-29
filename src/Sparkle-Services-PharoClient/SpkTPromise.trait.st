"
Some helpers for users of RsrPromise, especially RSR service clients.
"
Trait {
	#name : 'SpkTPromise',
	#category : 'Sparkle-Services-PharoClient-Support'
}

{ #category : 'accessing' }
SpkTPromise >> defaultCatchBlock [

	^ [ :reason | self signalPromiseBrokenBecause: reason ]
]

{ #category : 'signalling' }
SpkTPromise >> signalPromiseBrokenBecause: aReason [

	SpkBrokenPromiseError new
		reason: aReason;
		signal
]
