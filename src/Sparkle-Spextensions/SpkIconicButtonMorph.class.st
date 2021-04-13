"
A simple button with icon that can be enabled and disabled, and does _not_ use a table layout.
"
Class {
	#name : 'SpkIconicButtonMorph',
	#superclass : 'IconicButtonMorph',
	#traits : 'SpkTMorphEnablement',
	#classTraits : 'SpkTMorphEnablement classTrait',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'button' }
SpkIconicButtonMorph >> doButtonAction [

	self enabled ifFalse: [ ^ self ].
	super doButtonAction
]

{ #category : 'accessing' }
SpkIconicButtonMorph >> extraBorder [

	^ 0
]
