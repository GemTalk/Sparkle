Extension { #name : 'Collection' }

{ #category : 'Announcements-Extensions-GemStone' }
Collection >> removeAllSuchThat: aBlock [
	"Remove all elements of the receiver for which aBlock returns true.
	 Answer the removed elements.
	 This is a fallback implementation. It is not efficient."

	| toBeRemoved |
	toBeRemoved := self select: aBlock.
	self removeAll: toBeRemoved.
	^ toBeRemoved
]
