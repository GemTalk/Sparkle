Extension { #name : 'Behavior' }

{ #category : 'Announcements-Extensions-GemStone' }
Behavior >> includesBehavior: aBehavior [
	"Answer whether aBehavior is the receiver or a superclass of the receiver."

	^ self == aBehavior
		or: [self inheritsFrom: aBehavior]
]
