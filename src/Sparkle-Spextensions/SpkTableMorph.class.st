Class {
	#name : 'SpkTableMorph',
	#superclass : 'FTTableMorph',
	#traits : 'SpkTMorphEnablement',
	#classTraits : 'SpkTMorphEnablement classTrait',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'event handling' }
SpkTableMorph >> allowsKeymapping [

	"No meaningful key mappings for now, and some (like CR) produce 
	error because of wanting #selectedIndex, which I don't have."

	^ false
]

{ #category : 'accessing' }
SpkTableMorph >> beMultipleSelection [
	selectionStrategy := SpkFTMultipleSelection table: self.
	self secondarySelectionColor: self selectionColor
]

{ #category : 'accessing' }
SpkTableMorph >> defaultContainer [

	^ SpkTableContainerMorph new
]

{ #category : 'updating' }
SpkTableMorph >> themeChanged [
	super themeChanged.
	self beMultipleSelection
]
