"
Some helpers for users of RsrPromise, especially RSR service clients.
"
Trait {
	#name : 'SpkTPromise',
	#category : 'Sparkle-Services-Common',
	#package : 'Sparkle-Services-Common'
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
