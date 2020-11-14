Class {
	#name : 'SpkTableMorph',
	#superclass : 'FTTableMorph',
	#traits : 'SpkTMorphEnablement',
	#classTraits : 'SpkTMorphEnablement classTrait',
	#category : 'Sparkle-Spextensions-Morphic'
}

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
