Extension { #name : 'SpkLogger' }

{ #category : '*Sparkle-Tools-GemStone' }
SpkLogger class >> logError: messageString [
	GsFile gciLogServer: messageString
]
