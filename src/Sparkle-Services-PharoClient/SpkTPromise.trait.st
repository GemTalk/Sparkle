Trait {
	#name : 'SpkTPromise',
	#category : 'Sparkle-Services-PharoClient-Support'
}

{ #category : 'signalling' }
SpkTPromise >> signalPromiseBrokenBecause: aReason [

	SpkBrokenPromiseError new
		reason: aReason;
		signal
]
