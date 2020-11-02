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

	^'
.application [
	Font { #predefinedFont: #default },
	.label [
		Geometry { #hResizing: true, #height: 18 },
		.headerError [ Draw { #color:  Color{ #red: 1, #green: 0, #blue: 0, #alpha: 1}}  ],
		.headerSuccess [ Draw { #color: Color{ #red: 0, #green: 1, #blue: 0, #alpha: 1}}  ],
		.header [ Draw { #color: Color{ #rgb: 622413393 } } ],
		.shortcut [ Draw { #color: Color{ #rgb: 622413393 } } ],
		.fixed [ Geometry { #hResizing: false, #width: 100 } ],
		.dim [ Draw { #color : Color{ #rgb: 708480675 } } ]
	],
	.link [ Geometry { #hResizing: true } ],
	.button [  
		Geometry { #width: 100 },
		.small [ Geometry { #width: 26 } ]
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
	.toolBar [ 
		Geometry { #hResizing: true },
		.icons [ Geometry { #height: 30 } ],
		.iconsAndLabel [ Geometry { #height: 45 } ]
	],
	.text [ Geometry { #height: 0 } ],
	.code [ Font { #predefinedFont: #code } ],
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
		.error [ Draw { #color: #C20000 } ] ] ],
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
	superclass := sheet styleClassNamed: 'label'.
	superclass addClass: 'paneHeader' with: [ :c | 
		c
			"parent: superclass;" "Can't override parent geometry properly, so don't have a parent"
			addPropertyFontWith: [ :f | 
				f
					size: 12;
					bold: true ] ].
	self styleSheet: sheet
]

{ #category : 'running' }
SpkApplication >> start [
	self subclassResponsibility
]
