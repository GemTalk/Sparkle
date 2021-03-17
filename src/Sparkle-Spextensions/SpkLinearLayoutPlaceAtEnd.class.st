Class {
	#name : 'SpkLinearLayoutPlaceAtEnd',
	#superclass : 'SpkLinearLayout',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayoutPlaceAtEnd >> layoutWithAlignment [

	"No submorphs have #spaceFill, so place any extra space according to my alignment."

	self adjacentLayoutStartingAt: self extraSpace
]
