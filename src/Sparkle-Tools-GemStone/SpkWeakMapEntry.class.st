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
	"Create an instance and add it to aMap.
	The key and value are strongly referenced at least until the end of this method,
	so it's safe to make the new instance an ephemeron before it's 
	added to the map."

	| instance |
	instance := self new.
	instance
		key: aKey;
		value: aValue;
		owner: aMap;
		beEphemeron: true.
	^ aMap add: instance
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

	self owner removeEntry: self
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
