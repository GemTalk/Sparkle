"
Reader that creates SpkStyleClasses instead of SpStyleClasses.
"
Class {
	#name : 'SpkStyleSTONReader',
	#superclass : 'SpStyleVariableSTONReader',
	#category : 'Sparkle-Spextensions-StyleSheet'
}

{ #category : 'private' }
SpkStyleSTONReader >> styleClass [

	^ SpkStyleClass
]
