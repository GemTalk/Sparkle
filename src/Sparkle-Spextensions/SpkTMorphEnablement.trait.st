Trait {
	#name : 'SpkTMorphEnablement',
	#instVars : [
		'enabled'
	],
	#category : 'Sparkle-Spextensions-Morphic',
	#package : 'Sparkle-Spextensions',
	#tag : 'Morphic'
}

{ #category : 'accessing' }
SpkTMorphEnablement >> enabled [

	^ enabled ifNil: [ 
		  enabled := self owner
			             ifNil: [ true ]
			             ifNotNil: [ :myOwner | myOwner enabled ] ]
]

{ #category : 'accessing' }
SpkTMorphEnablement >> enabled: aBoolean [

	self submorphsDo: [ :morph | morph enabled: aBoolean ].
	enabled := aBoolean
	"self logEnablement"
]

{ #category : 'accessing' }
SpkTMorphEnablement >> handlesMouseOver: anEvent [

	"Only change appearance on mouseover if enabled"

	^ self enabled and: [ super handlesMouseOver: anEvent ]
]

{ #category : 'accessing' }
SpkTMorphEnablement >> mouseDown: anEvent [

	self enabled ifFalse: [ ^ self ].
	^ super mouseDown: anEvent
]
