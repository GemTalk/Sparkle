"
Abstract application for Sparkle applications
"
Class {
	#name : 'SpkApplication',
	#superclass : 'SpApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'initialization' }
SpkApplication >> initialize [

	super initialize.
	iconManager := SpkIconLibrary current.
	self initializeSylesheet
]

{ #category : 'initialization' }
SpkApplication >> initializeSylesheet [

	| sheet superclass |
	"Start with a what is effectively a copy of the default style sheet, 
	then add our specific classes."
	sheet := SpkStyleSTONReader fromString: SpStyle defaultStyleSheetData.
	superclass := sheet styleClassNamed: 'label'.
	superclass addClass: 'paneHeader' with: [ :c | 
		c addPropertyFontWith: [ :f | 
			f
				name: 'Source Sans Pro';
				size: 12;
				bold: true ] ].
	self styleSheet: sheet
]

{ #category : 'running' }
SpkApplication >> start [
	self subclassResponsibility
]
