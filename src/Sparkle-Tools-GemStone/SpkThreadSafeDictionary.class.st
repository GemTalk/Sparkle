Class {
	#name : 'SpkThreadSafeDictionary',
	#superclass : 'RsrThreadSafeDictionary',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkThreadSafeDictionary >> at: key ifPresent: presentBlock ifAbsentPut: absentBlock [
	| existing wasPresent |
	wasPresent := true.
	self
		critical: [ 
			existing := map
				at: key
				ifAbsentPut: [ 
					wasPresent := false.
					absentBlock value ] ].
	wasPresent
		ifTrue: [ presentBlock cull: existing ]
]
