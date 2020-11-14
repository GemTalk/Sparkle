"
Probably not going to use this class. PluggableButtonMorphs use Morphic's TableLayout, and I just can _not_ get that thing to behave sanely.
"
Class {
	#name : 'SpkPluggableButtonMorph',
	#superclass : 'PluggableButtonMorph',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'style' }
SpkPluggableButtonMorph >> normalBorderStyle [

	"When idle and mouse is not over, make border transparent."

	^ super normalBorderStyle
		  baseColor: Color transparent;
		  yourself
]

{ #category : 'protocol' }
SpkPluggableButtonMorph >> takeKeyboardFocus [

	"In the immortal words of Darth Vader: DO NOT WANT"

	^ self
]

{ #category : 'keyboard' }
SpkPluggableButtonMorph >> wantsKeyboardFocus [

	"Answer whether the receiver can normally take keyboard focus."

	^ false
]
