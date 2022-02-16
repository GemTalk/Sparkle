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
