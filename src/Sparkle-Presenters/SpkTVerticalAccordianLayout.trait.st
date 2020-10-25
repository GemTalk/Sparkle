Trait {
	#name : 'SpkTVerticalAccordianLayout',
	#instVars : [
		'spkLayout'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'specs' }
SpkTVerticalAccordianLayout classSide >> defaultSpec [

	"This method only here to quiet browser linting. Should never be sent to this class.
	See instance-side #layout."

	self error: '#defaultSpec sent when not expected'
]

{ #category : 'accessing' }
SpkTVerticalAccordianLayout >> layout [

	"Cannot use the instvar 'layout' since it is defined in a superclass as an observable slot."

	^ spkLayout ifNil: [ spkLayout := SpkAccordianLayout newVertical ]
]
