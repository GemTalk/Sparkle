"
Style class that knows how to search for its styles by name.
"
Class {
	#name : 'SpkClassStyle',
	#superclass : 'SpClassStyle',
	#category : 'Sparkle-Spextensions-StyleSheet'
}

{ #category : 'searching' }
SpkClassStyle >> styleClassNamed: desiredName [

	"Answer a ClassStyle that is my subclass with the given name. There must be exactly one."

	| classes |
	classes := styles select: [ :aStyle | 
		           aStyle isStyleClass and: [ aStyle name = desiredName ] ].
	classes isEmpty ifTrue: [ self error: 'Style class not found' ].
	classes size > 1 ifTrue: [ self error: 'Duplicate style class name!' ].
	^ classes first
]
