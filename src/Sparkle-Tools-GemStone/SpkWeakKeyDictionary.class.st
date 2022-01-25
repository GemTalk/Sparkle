Class {
	#name : 'SpkWeakKeyDictionary',
	#superclass : 'SpkWeakDictionary',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'private' }
SpkWeakKeyDictionary >> elementClass [
	^ SpkWeakKeyMapEntry
]
