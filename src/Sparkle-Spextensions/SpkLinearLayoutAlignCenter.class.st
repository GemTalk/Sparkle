Class {
	#name : 'SpkLinearLayoutAlignCenter',
	#superclass : 'SpkLinearLayout',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayoutAlignCenter >> layoutWithAlignment [

	"No submorphs have #spaceFill, so place any extra space according to my alignment."

	self adjacentLayoutStartingAt: self extraSpace // 2
]
