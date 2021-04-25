Trait {
	#name : 'SpkTMorphEnablement',
	#instVars : [
		'enabled'
	],
	#category : 'Sparkle-Spextensions-Morphic'
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

{ #category : 'logging' }
SpkTMorphEnablement >> logEnablement [

	"For debugging, normally unused."

	| stateString shouldDumpStack classOfInterest |
	stateString := self enabled
		               ifTrue: [ 'Enabling ' ]
		               ifFalse: [ 'Disabling ' ].
	Transcript crShow:
		stateString , self class name , ' ' , self identityHash printString.

	shouldDumpStack := false.
	shouldDumpStack ifFalse: [ ^ self ].
	classOfInterest := Object.
	self class == classOfInterest ifFalse: [ ^ self ].
	Transcript crShow: RsrProcessModel currentStackDump
]

{ #category : 'accessing' }
SpkTMorphEnablement >> mouseDown: anEvent [

	self enabled ifFalse: [ ^ self ].
	^ super mouseDown: anEvent
]
