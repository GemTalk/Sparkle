Extension { #name : 'ExecBlock' }

{ #category : '*Announcements-Extensions-GemStone' }
ExecBlock >> hasReceiver [
	"Not all blocks record the receiver, so we need to know whether a block has done so."

	^ (staticLink notNil and: [self selfOffsetInVC > 1])
		or: [self _selfOffsetInSelf > 0]
]

{ #category : '*Announcements-Extensions-GemStone' }
ExecBlock >> receiver [

	^self selfValue
]
