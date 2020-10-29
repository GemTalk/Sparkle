Class {
	#name : 'SpkLinearLayoutAlignBegin',
	#superclass : 'SpkLinearLayout',
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'layout' }
SpkLinearLayoutAlignBegin >> layoutWithAlignment [

	"No submorphs have #spaceFill, so place any extra space according to my alignment."

	self adjacentLayoutStartingAt: 0
]
