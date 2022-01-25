"
An ephemeron, one entry in an SpkWeakKeyMap.
"
Class {
	#name : 'SpkWeakKeyMapEntry',
	#superclass : 'SpkWeakMapEntry',
	#instVars : [
		'key',
		'value',
		'owner'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'instance creation' }
SpkWeakKeyMapEntry class >> key: aKey value: aValue owner: aMap [
	"Create an instance and add it to aMap.
	aKey is strongly referenced at least until the end of this method,
	so it's safe to make the new instance an ephemeron before it's 
	added to the map."

	| instance |
	instance := self basicNew.
	instance
		key: aKey;
		value: aValue;
		owner: aMap;
		beEphemeron: true.
	^ aMap add: instance
]

{ #category : 'accessing' }
SpkWeakKeyMapEntry >> key [
	^key
]

{ #category : 'accessing' }
SpkWeakKeyMapEntry >> key: object [
	key := object
]

{ #category : 'accessing' }
SpkWeakKeyMapEntry >> owner [
	^owner
]

{ #category : 'accessing' }
SpkWeakKeyMapEntry >> owner: object [
	owner := object
]

{ #category : 'accessing' }
SpkWeakKeyMapEntry >> value [
	^value
]

{ #category : 'accessing' }
SpkWeakKeyMapEntry >> value: object [
	value := object
]
