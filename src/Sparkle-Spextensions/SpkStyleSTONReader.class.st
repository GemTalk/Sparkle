"
Reader that creates SpkStyleClasses instead of SpStyleClasses.
"
Class {
	#name : 'SpkStyleSTONReader',
	#superclass : 'SpStyleSTONReader',
	#category : 'Sparkle-Spextensions-StyleSheet'
}

{ #category : 'private' }
SpkStyleSTONReader >> lookupClass: name [

	"The SpStyleSTONReader only looks for ston names in the hierarchy of SpStyle"

	"Unlike the superclass implementation, look at subclasses first to allow them to
	steal the STON name of their superclass."

	^ classes at: name ifAbsentPut: [ 
		  (SpStyle allSubclasses , Color withAllSubclasses) reverse
			  detect: [ :class | 
			  class isMeta not and: [ class stonName = name ] ]
			  ifNone: [ NotFound signalFor: name ] ]
]

{ #category : 'private' }
SpkStyleSTONReader >> styleClass [

	^ SpkStyleClass
]
