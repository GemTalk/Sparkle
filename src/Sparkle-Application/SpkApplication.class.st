"
Abstract application for Sparkle applications
"
Class {
	#name : 'SpkApplication',
	#superclass : 'SpApplication',
	#category : 'Sparkle-Application'
}

{ #category : 'private' }
SpkApplication >> defaultStyleSheetData [

	^ '
.application [
	Font { #name : EnvironmentFont(#default) },
	.label [
		.headerError [ Draw { #color:  #red }  ],
		.headerSuccess [ Draw { #color: #green } ],
		.header [ Draw { #color: Color{ #rgb: 622413393 } } ],
		.shortcut [ Draw { #color: Color{ #rgb: 622413393 } } ],
		.fixed [ Geometry { #hResizing: false, #width: 100 } ],
		.dim [ Draw { #color : Color{ #rgb: 708480675 } } ],
		.paneHeader [ Font { #size: 12, #bold: true } ]
	],
	.link [ Geometry { #hResizing: true } ],
	.button [  
		Geometry { #width: 100 },
		.small [ 
			Geometry { #width: 25 },
			Container { #borderWidth: 0 } ]
	],
	.checkBox [  
		Geometry { #hResizing: true },
		.compact [ Geometry { #hResizing: false, #width: 20 } ]
	],
	.radioButton [ Geometry { #hResizing: true } ],
	.dropList [ Geometry { #width: 150, #hResizing: true } ],
	.list [ Geometry { #width: 150, #hResizing: true, #vResizing: true } ],
	.slider [ Geometry { #width: 150, #hResizing: true } ],
	.actionBar [  
		Container { #borderWidth: 0, #padding: 5 },
		Geometry { #width: 150, #height: 29, #hResizing: true, #vResizing: false }
	],
	.menuBar [ Geometry { #width: 150, #hResizing: true } ],
	.actionButton [  
		Geometry { #width: 60, #hResizing: false },
		.showIcon [ Geometry { #width: 25 } ]
	],
	.toolbar [ 
		Geometry { #hResizing: true },
		.icons [ Geometry { #height: 30 } ],
		.iconsAndLabel [ Geometry { #height: 45 } ]
	],
	.text [ Geometry { #height: 0 } ],
	.code [ Font { #name: EnvironmentFont(#code) } ],
	.codePopover [ 
		Draw { #color : #transparent },
		.button [ Geometry { #width : 25 } ]
	],
	.codePopoverError [ 
		Draw { #backgroundColor: #C20000 },
		Font { #color: #white } 
	],
	.scrollbarPopoverLarge [ Geometry { #height: 350 } ],
	.popover [
		.print [ Draw { #color: EnvironmentColor(#balloonBackground) } ],
		.error [ Draw { #color: #C20000 } ],
		.popoverButton [ Draw { #color: EnvironmentColor(#popoverButton) } ] ],
	.paginator [ Geometry { #height: 20 } ] ]
'
]

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
	sheet := SpkStyleSTONReader fromString: self defaultStyleSheetData.
	"superclass := sheet styleClassNamed: 'label'.
	superclass addClass: 'paneHeader' with: [ :c | 
		c
			addPropertyFontWith: [ :f | 
				f
					size: 12;
					bold: true ];
			addPropertyGeometryWith: [ :g | g height: SpStyleVariableReset new ] ]."
	self styleSheet: sheet
]

{ #category : 'running' }
SpkApplication >> start [
	self subclassResponsibility
]
