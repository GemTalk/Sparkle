Class {
	#name : 'SpkWeakKeyDictionary',
	#superclass : 'SpkWeakDictionary',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'private' }
SpkWeakKeyDictionary >> entryClass [
	^ SpkWeakKeyMapEntry
]
