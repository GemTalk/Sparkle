Class {
	#name : 'SpkThreadSafeDictionary',
	#superclass : 'RsrThreadSafeDictionary',
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkThreadSafeDictionary >> at: key ifPresent: presentBlock ifAbsentPut: absentBlock [
	"Answer result of either the presentBlock or the absentBlock"

	| value wasPresent |
	wasPresent := true.
	self
		critical: [ 
			value := map
				at: key
				ifAbsentPut: [ 
					wasPresent := false.
					absentBlock value ] ].
	^ wasPresent
		ifTrue: [ presentBlock cull: value ]
		ifFalse: [ value ]
]
