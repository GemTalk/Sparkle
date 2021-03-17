Class {
	#name : 'SpkLinearLayoutPlaceInCenter',
	#superclass : 'SpkLinearLayout',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayoutPlaceInCenter >> layoutWithAlignment [

	"No submorphs have #spaceFill, so place any extra space according to my alignment."

	self adjacentLayoutStartingAt: self extraSpace // 2
]
