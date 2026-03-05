"
Abstract application for Sparkle applications
"
Class {
	#name : 'SpkApplication',
	#superclass : 'SpApplication',
	#category : 'Sparkle-Application',
	#package : 'Sparkle-Application'
}

{ #category : 'as yet unclassified' }
SpkApplication >> defaultStyleSheetSource [
^'
.application [
]'
]

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

	| sheet labelClass |
	"Start with a what is effectively a copy of the default style sheet, 
	then add our specific classes."
	self styleSheet: (SpkStyleSTONReader fromString: self defaultStyleSheetSource).
	"labelClass := sheet styleClassNamed: 'label'.
	""sheet addClass: 'label' with: [ :c |
		c""
	labelClass
		addClass: 'paneHeader' with: [ :ph |
			ph addPropertyFontWith: [ :f | "";
					addPropertyGeometryWith: [ :g |
					g height: SpStyleResetVariable new ]""
					f
						size: 12;
						bold: true ] ];
		addClass: 'elapsedTime' with: [ :et |
		et
			addPropertyFontWith: [ :f |
				f
					size: 96;
					bold: true ];
			addPropertyDrawWith: [ :d | "";
				addPropertyGeometryWith: [ :g |
				g height: SpStyleResetVariable new ]""
				d color: #white ] ].
	""addPropertyGeometryWith: [ :g | g height: SpStyleResetVariable new ];""
	sheet
		addClass: 'window'
		with: [ :w | w addPropertyDrawWith: [ :d | d color: SpStyleResetVariable new ].
			w addPropertyDrawWith: [ :d | d color: #black ].
			w
				addClass: 'stopwatch'
				with: [ :sw | sw addPropertyDrawWith: [ :d | d color: #black ] ] ].
	self styleSheet: sheet"
]

{ #category : 'private factory' }
SpkApplication >> newIconProvider [

	^ SpkIconLibrary current
]

{ #category : 'running' }
SpkApplication >> start [
	self subclassResponsibility
]
