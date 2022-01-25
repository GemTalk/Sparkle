"
Abstract superclass for entries in an SpkWeakMap. 
This class must have *no* instance variables, since concrete subclasses will be ephemerons and need to reserve the first slot for the weak key or value.
"
Class {
	#name : 'SpkWeakMapEntry',
	#superclass : 'SpkObject',
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'instance creation' }
SpkWeakMapEntry class >> key: aKey value: aValue owner: aMap [
	"Sender must hold map's mutex."

	"Create an instance to be added to aMap.
	Sender must ensure that the key (or value) 
	are strongly referenced until the new entry
	is fully added to the map, so that ephemeron
	mourning does not try to remove an entry
	that is not yet there."

	^ self new
		key: aKey;
		value: aValue;
		owner: aMap;
		beEphemeron: true;
		yourself
]

{ #category : 'instance creation' }
SpkWeakMapEntry class >> new [
	self == SpkWeakMapEntry
		ifTrue: [ 
			^ self
				error:
					'Should not create instance of abstract class. Try a concrete subclass instead.' ].
	^ super new
]

{ #category : 'accessing' }
SpkWeakMapEntry >> key [
	self subclassResponsibility
]

{ #category : 'accessing' }
SpkWeakMapEntry >> key: anObject [
	self subclassResponsibility
]

{ #category : 'mourning' }
SpkWeakMapEntry >> mourn [
	
	self owner removeKey: self key.
]

{ #category : 'accessing' }
SpkWeakMapEntry >> owner [
	self subclassResponsibility
]

{ #category : 'accessing' }
SpkWeakMapEntry >> owner: anObject [
	self subclassResponsibility
]

{ #category : 'accessing' }
SpkWeakMapEntry >> value [
	self subclassResponsibility
]

{ #category : 'accessing' }
SpkWeakMapEntry >> value: anObject [
	self subclassResponsibility
]
