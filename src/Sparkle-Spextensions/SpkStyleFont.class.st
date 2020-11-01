"
I fix the merging problem in my superclass, which tends to produce styles that have both a predefinedFont and other parameters.
"
Class {
	#name : 'SpkStyleFont',
	#superclass : 'SpStyleFont',
	#category : 'Sparkle-Spextensions-StyleSheet'
}

{ #category : 'operations' }
SpkStyleFont >> mergeWith: otherProperty [

	"For the property predefinedFont, a nil in otherProperty should override a non-nil value, 
	if there are in fact any other non-nil values in otherProperty. "

	| merged numberOfOverridingSlots |
	merged := super mergeWith: otherProperty.
	numberOfOverridingSlots := 0.
	self class allSlots do: [ :eachSlot | 
		(otherProperty readSlot: eachSlot) ifNotNil: [ 
			numberOfOverridingSlots := numberOfOverridingSlots + 1 ] ].
	numberOfOverridingSlots > 0 and: [ 
		otherProperty predefinedFont ifNil: [ merged predefinedFont: nil ] ].
	^ merged
]
