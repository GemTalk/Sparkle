"
Reader that creates SpkStyleClasses instead of SpStyleClasses.
"
Class {
	#name : 'SpkStyleSTONReader',
	#superclass : 'SpStyleVariableSTONReader',
	#category : 'Sparkle-Spextensions-StyleSheet',
	#package : 'Sparkle-Spextensions',
	#tag : 'StyleSheet'
}

{ #category : 'private' }
SpkStyleSTONReader >> styleClass [

	^ SpkClassStyle
]
