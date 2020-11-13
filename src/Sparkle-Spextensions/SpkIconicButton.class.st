"
A simple button with icon that can be enabled and disabled, and does _not_ use a table layout.
"
Class {
	#name : 'SpkIconicButton',
	#superclass : 'IconicButton',
	#instVars : [
		'enabled'
	],
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'button' }
SpkIconicButton >> doButtonAction [

	enabled ifFalse: [ ^ self ].
	super doButtonAction
]

{ #category : 'accessing' }
SpkIconicButton >> enabled [

	^ enabled
]

{ #category : 'accessing' }
SpkIconicButton >> enabled: anObject [

	enabled := anObject
]

{ #category : 'mouse events' }
SpkIconicButton >> handlesMouseOver: anEvent [

	"Only change appearance on mouseover if enabled"

	^ enabled
]

{ #category : 'initialization' }
SpkIconicButton >> initialize [

	super initialize.
	enabled := true
]

{ #category : 'mouse events' }
SpkIconicButton >> mouseDown: anEvent [

	enabled ifFalse: [ ^ self ].
	^ super mouseDown: anEvent
]
