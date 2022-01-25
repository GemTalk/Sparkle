"
Abstract. A hashed collection consisting of weak map entries, each of which contains both the key and value.

Portions adapted from Pharo 9, also MIT licensed. (Thanks, Pharo team!)
"
Class {
	#name : 'SpkWeakDictionary',
	#superclass : 'SpkObject',
	#instVars : [
		'mutex',
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

{ #category : 'private' }
SpkWeakDictionary >> add: aMapEntry [
	"The given map entry must already know that I'm its owner."

	self
		critical: [ 
			| index element |
			index := self findEntryOrNil: aMapEntry key.
			element := table at: index.
			element
				ifNil: [ self atNewIndex: index put: aMapEntry ]
				ifNotNil: [ element value: aMapEntry value ] ].
	^ aMapEntry
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: key ifAbsent: aBlock [
	"Answer the value associated with the key or, if key isn't found,
	answer the result of evaluating aBlock.
	Evaluation of aBlock happens *outside* my critical section."

	| entry value |
	self
		critical: [ 
			entry := table at: (self findEntryOrNil: key).
			entry ifNotNil: [ :e | value := e value ] ].  "Must grab value inside critical section."
	^ entry ifNil: aBlock value ifNotNil: [ value ]
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: key ifPresent: aBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the given block optionally with the value associated
	with the key. Block evaluation happens *outside* my critical section.
	Otherwise, answer nil."

	| entry value |
	self
		critical: [ 
			entry := table at: (self findEntryOrNil: key).
			entry ifNotNil: [ :e | value := e value ] ].	"Must grab value inside critical section."
	^ entry ifNotNil: [ aBlock cull: value ]
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the first block optionally with the value associated
	with the key.
	Otherwise answer the value of the second block.
	Block evaluation happens *outside* my critical section."

	| entry value |
	self
		critical: [ 
			entry := table at: (self findEntryOrNil: key).
			entry ifNotNil: [ :e | value := e value ] ].	"Must grab value inside critical section."
	^ entry ifNil: anAbsentBlock ifNotNil: [ aPresentBlock cull: value ]
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: key ifPresent: aPresentBlock ifAbsentPut: anAbsentBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the first block optionally with the value associated
	with the key. PresentBlock evaluation happens *outside* my critical section.
	Otherwise store and return the result of evaluating the second block as the
	new value of the key. AbsentBlock evaluation happens *inside* my critical 
	section to prevent race conditions on ifAbsentPut:."

	| entry value |
	self
		critical: [ 
			entry := table at: (self findEntryOrNil: key).
			entry
				ifNotNil: [ :e | value := e value ]
				ifNil: [ ^ self unprotectedAt: key put: anAbsentBlock value ] ].	"Must grab value inside critical section."
	^ aPresentBlock cull: value
]

{ #category : 'accessing' }
SpkWeakDictionary >> at: aKey put: aValue [
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set its value to anObject. Answer anObject."

	^ self critical: [self unprotectedAt: aKey put: aValue]
]

{ #category : 'private' }
SpkWeakDictionary >> atNewIndex: index put: anObject [
	"Sender must hold my mutex."
	
	table at: index put: anObject.
	tally := tally + 1.
	self fullCheck
]

{ #category : 'private' }
SpkWeakDictionary >> critical: aBlock [

	^mutex critical: aBlock
]

{ #category : 'private' }
SpkWeakDictionary >> entryClass [
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
SpkWeakDictionary >> findEntryOrNil: anObject [
	"Sender must hold my mutex."

	"Answer the index of a first slot containing either a nil (indicating an empty slot) 
	or an entry that matches the given object. Answer the index of that slot or zero. 
	Fail if neither a match nor an empty slot is found."

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
	"Sender must hold my mutex."

	"The element at start has been removed and replaced by nil.
	This method moves forward from there, relocating any entries
	that had been placed below due to collisions with this one."

	| element index |
	index := start.
	[ (element := table at: (index := index \\ table size + 1)) == nil ]
		whileFalse: [ 
			| newIndex |
			(newIndex := self findEntryOrNil: element key) = index
				ifFalse: [ self swapIndex: index withIndex: newIndex ] ]
]

{ #category : 'private' }
SpkWeakDictionary >> fullCheck [
	"Sender must hold my mutex."

	"Keep table at least 30% free for decent hash behavior"

	tally * 10 > (table size * 7)
		ifTrue: [ self grow ]
]

{ #category : 'private' }
SpkWeakDictionary >> grow [
	"Sender must hold my mutex."

	"Grow the table to at least double its size, and reinsert all elements"

	| oldTable |
	oldTable := table.
	table := Array new: (SpkHashTableSizes atLeast: oldTable size * 2).
	tally := 0.
	oldTable
		do: [ :anElement | anElement ifNotNil: [ self noCheckAdd: anElement ] ]
]

{ #category : 'private' }
SpkWeakDictionary >> hashOf: anObject [

	^ SpkHashTableSizes hashMultiply: anObject hash
]

{ #category : 'initialization' }
SpkWeakDictionary >> initialize [
	super initialize.
	mutex := Semaphore forMutualExclusion
]

{ #category : 'initialization' }
SpkWeakDictionary >> initialize: n [
	"Initialize table with a capacity of n"
	table := Array new: n.
	tally := 0
]

{ #category : 'private' }
SpkWeakDictionary >> noCheckAdd: aMapEntry [
	"Sender must hold my mutex."

	table at: (self findEntryOrNil: aMapEntry key) put: aMapEntry.
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
	the value externally named by key.
	Block evaluation happens *outside* my critical section."

	| entry value |
	self
		critical: [ 
			| index |
			index := self findEntryOrNil: key.
			entry := table at: index.
			entry
				ifNotNil: [ 
					value := entry value.
					table at: index put: nil.
					tally := tally - 1.
					self fixCollisionsFrom: index ] ].
	^ entry ifNotNil: [ value ] ifNil: aBlock
]

{ #category : 'private' }
SpkWeakDictionary >> scanFor: anObject [
	"Scan the table for the first slot containing either a nil (indicating an empty slot) or an element whose key matches anObject. Answer the index of that slot or zero if no slot is found. This method will be overridden in various subclasses that have different interpretations for matching elements."

	"Sender must hold my mutex."

	| entry start finish |
	finish := table size.
	start := (self hashOf: anObject) \\ finish + 1.	

	"Search from (hash mod size) to the end."
	start to: finish do: [ :index | 
		((entry := table at: index) == nil or: [ entry key = anObject ])
			ifTrue: [ ^ index ] ].	

	"Search from 1 to where we started."
	1 to: start - 1 do: [ :index | 
		((entry := table at: index) == nil or: [ entry key = anObject ])
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

{ #category : 'private' }
SpkWeakDictionary >> unprotectedAt: aKey put: aValue [
	"Sender must hold my mutex."

	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set its value to anObject. Answer anObject."

	| index entry |
	index := self findEntryOrNil: aKey.
	entry := table at: index.
	entry
		ifNil: [ 
			self
				atNewIndex: index
				put: (self entryClass key: aKey value: aValue owner: self) ]
		ifNotNil: [ entry value: aValue ].
	^ aValue
]
