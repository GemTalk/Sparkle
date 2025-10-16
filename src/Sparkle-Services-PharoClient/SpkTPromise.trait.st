"
Some helpers for users of RsrPromise, especially RSR service clients.
"
Trait {
	#name : 'SpkTPromise',
	#category : 'Sparkle-Services-PharoClient-Support',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Support'
}

{ #category : 'accessing' }
SpkTPromise >> defaultCatchBlock [

	^ [ :reason |
	  reason class == RsrConnectionClosedBeforeReceivingResponse
		  ifFalse: [
			  SpkBadNewsDialogWindow
				  openOnNews: reason printString
				  titled: 'Broken Promise' ] ]
]
