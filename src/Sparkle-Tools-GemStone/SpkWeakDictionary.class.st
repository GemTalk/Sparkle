"
Abstract. A hashed collection consisting of weak map entries, each of which contains both the key and value.

Portions adapted from Pharo 9, also MIT licensed. (Thanks, Pharo team!)
"
Class {
	#name : 'SpkWeakDictionary',
	#superclass : 'SpkObject',
	#instVars : [
		'tally',
		'table'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'instance creation' }
SpkWeakDictionary class >> new [
	^ self basicNew
		initialize: 5;
		yourself
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: key ifAbsent: aBlock [ 
	"Answer the value associated with the key or, if key isn't found,
	answer the result of evaluating aBlock."

	^((table at: (self findElementOrNil: key)) 
			ifNil: [aBlock] 
			ifNotNil: [:element | element]) value.
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: key ifPresent: aBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the given block optionally with the value associated
	with the key.
	Otherwise, answer nil."

	^(table at: (self findElementOrNil: key))
		ifNotNil: [:element | aBlock cull: element value]
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the first block optionally with the value associated
	with the key.
	Otherwise answer the value of the second block."

	self at: key ifPresent: [:v | ^ aPresentBlock cull: v].
	^ anAbsentBlock value
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: key ifPresent: aPresentBlock ifAbsentPut: anAbsentBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the first block optionally with the value associated
	with the key.
	Otherwise store and return the result of evaluating the second block as the
	new value of the key."

	^ self
		at: key
		ifPresent: aPresentBlock
		ifAbsent: [self at: key put: anAbsentBlock value]
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: key put: anObject [
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set its value to anObject. Answer anObject."

	| index element |
	index := self findElementOrNil: key.
	element := table at: index.
	element
		ifNil: [ 
			self
				atNewIndex: index
				put: (self elementClass key: key value: anObject owner: self) ]
		ifNotNil: [ element value: anObject ].
	^ anObject
]

{ #category : 'private' }
SpkWeakDictionary >> atNewIndex: index put: anObject [
	table at: index put: anObject.
	tally := tally + 1.
	self fullCheck
]

{ #category : 'private' }
SpkWeakDictionary >> elementClass [
	self subclassResponsibility
]

{ #category : 'private' }
SpkWeakDictionary >> errorKeyNotFound: aKey [
	LookupError new
		object: self;
		key: aKey;
		signal: 'Key not found'
]

{ #category : 'private' }
SpkWeakDictionary >> findElementOrNil: anObject [
	"Answer the index of a first slot containing either a nil (indicating an empty slot) or an element that matches the given object. Answer the index of that slot or zero. Fail if neither a match nor an empty slot is found."

	| index |

	index := self scanFor: anObject.
	index > 0 ifTrue: [^index].

	"Bad scene.  Neither have we found a matching element
	nor even an empty slot.  No hash table is ever supposed to get
	completely full."
	self error: 'There is no free space in this hash table!'.
]

{ #category : 'private' }
SpkWeakDictionary >> fixCollisionsFrom: start [
	"The element at start has been removed and replaced by nil.
	This method moves forward from there, relocating any entries
	that had been placed below due to collisions with this one."

	| element index |
	index := start.
	[ (element := table at: (index := index \\ table size + 1)) == nil ]
		whileFalse: [ 
			| newIndex |
			(newIndex := self findElementOrNil: element key) = index
				ifFalse: [ self swapIndex: index withIndex: newIndex ] ]
]

{ #category : 'private' }
SpkWeakDictionary >> fullCheck [
	"Keep table at least 30% free for decent hash behavior"

	tally * 10 > (table size * 7)
		ifTrue: [ self grow ]
]

{ #category : 'private' }
SpkWeakDictionary >> grow [
	"Grow the table to at least double its size, and reinsert all elements"

	| oldTable |
	oldTable := table.
	table := Array new: (self tableSizeAtLeast: oldTable size * 2).
	tally := 0.
	oldTable
		do: [ :anElement | anElement ifNotNil: [ self noCheckAdd: anElement ] ]
]

{ #category : 'initialization' }
SpkWeakDictionary >> initialize: n [
	"Initialize table with a capacity of n"
	table := Array new: n.
	tally := 0
]

{ #category : 'private' }
SpkWeakDictionary >> noCheckAdd: aMapEntry [
	table at: (self findElementOrNil: aMapEntry key) put: aMapEntry.
	tally := tally + 1
]

{ #category : 'removing' }
SpkWeakDictionary >> removeKey: key [ 
	"Remove key from the receiver.
	If key is not in the receiver, signal an error."

	^ self removeKey: key ifAbsent: [self errorKeyNotFound: key]
]

{ #category : 'removing' }
SpkWeakDictionary >> removeKey: key ifAbsent: aBlock [ 
	"Remove key (and its associated value) from the receiver. If key is not in 
	the receiver, answer the result of evaluating aBlock. Otherwise, answer 
	the value externally named by key."

	| index element |
	index := self findElementOrNil: key.
	element := table at: index.
	element == nil ifTrue: [ ^ aBlock value ].
	table at: index put: nil.
	tally := tally - 1.
	self fixCollisionsFrom: index.
	^ element value
]

{ #category : 'private' }
SpkWeakDictionary >> scanFor: anObject [
	"Scan the table for the first slot containing either a nil (indicating an empty slot) or an element whose key matches anObject. Answer the index of that slot or zero if no slot is found. This method will be overridden in various subclasses that have different interpretations for matching elements."

	| element start finish |
	finish := table size.
	start := (self hashOf: anObject) \\ finish + 1.	

	"Search from (hash mod size) to the end."
	start to: finish do: [ :index | 
		((element := table at: index) == nil or: [ element key = anObject ])
			ifTrue: [ ^ index ] ].	

	"Search from 1 to where we started."
	1 to: start - 1 do: [ :index | 
		((element := table at: index) == nil or: [ element key = anObject ])
			ifTrue: [ ^ index ] ].

	^ 0	"No match AND no empty slot"
]

{ #category : 'private' }
SpkWeakDictionary >> swapIndex: firstIndex withIndex: secondIndex [
	| element |
	element := table at: firstIndex.
	table
		at: firstIndex put: (table at: secondIndex);
		at: secondIndex put: element
]
