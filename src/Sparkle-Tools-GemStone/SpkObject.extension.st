Extension { #name : 'SpkObject' }

{ #category : '*Sparkle-Tools-GemStone' }
SpkObject class >> new [
	^ super new initialize
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkObject >> flag: anObject [
	"Look at senders of #flag: to find code that needs further attention"
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkObject >> initialize [
	"Subclasses can do what they like; default is to do nothing."
]
