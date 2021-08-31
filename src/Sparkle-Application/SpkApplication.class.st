"
Abstract application for Sparkle applications
"
Class {
	#name : 'SpkApplication',
	#superclass : 'SpApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'showing' }
SpkApplication >> defaultWindowPresenterClass [

	^SpkWindowPresenter 
]

{ #category : 'initialization' }
SpkApplication >> initialize [

	super initialize.
	self initializeSylesheet
]

{ #category : 'initialization' }
SpkApplication >> initializeSylesheet [

	| sheet superclass |
	"Start with a what is effectively a copy of the default style sheet, 
	then add our specific classes."
	sheet := SpkStyleSTONReader fromString: SpStyle defaultStyleSheetData.
	superclass := sheet styleClassNamed: 'label'.
	superclass
		addPropertyGeometryWith: [ :g | g height: SpStyleResetVariable new ];
		addClass: 'paneHeader' with: [ :c | 
			c
				addPropertyFontWith: [ :f | 
					f
						size: 12;
						bold: true ];
				addPropertyGeometryWith: [ :g | 
				g height: SpStyleResetVariable new ] ].
	self styleSheet: sheet
]

{ #category : 'private factory' }
SpkApplication >> newIconProvider [

	^ SpkIconLibrary current
]

{ #category : 'running' }
SpkApplication >> start [
	self subclassResponsibility
]
