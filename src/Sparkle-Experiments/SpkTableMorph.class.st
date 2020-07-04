Class {
	#name : 'SpkTableMorph',
	#superclass : 'FTTableMorph',
	#category : 'Sparkle-Experiments'
}

{ #category : 'accessing' }
SpkTableMorph >> beMultipleSelection [
	selectionStrategy := SpkMultipleSelection table: self.
	self secondarySelectionColor: self selectionColor
]

{ #category : 'updating' }
SpkTableMorph >> themeChanged [
	super themeChanged.
	self beMultipleSelection
]
