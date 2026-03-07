"
Abstract application for Sparkle applications
"
Class {
	#name : 'SpkApplication',
	#superclass : 'SpApplication',
	#category : 'Sparkle-Application',
	#package : 'Sparkle-Application'
}

{ #category : 'styling' }
SpkApplication >> defaultStyleSheetSource [
^'
.application [
	.label [
		.paneHeader [ Font { #name : EnvironmentFont(#default), #size : 12, #bold : true } ],
		.elapsedTime [ 
			Font { #name : EnvironmentFont(#default), #size : 96, #bold : true },
			Draw { #color : #white }
		]
	]
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

	self styleSheet:
		(SpkStyleSTONReader fromString: self defaultStyleSheetSource)
]

{ #category : 'private factory' }
SpkApplication >> newIconProvider [

	^ SpkIconLibrary current
]

{ #category : 'running' }
SpkApplication >> start [
	self subclassResponsibility
]
