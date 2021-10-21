Trait {
	#name : 'SpkTHeader',
	#instVars : [
		'header'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'accessing' }
SpkTHeader >> header [

	^ header
]

{ #category : 'initialization' }
SpkTHeader >> initializeHeader [

	header := self instantiate: self headerClass on: self model.
	self layout
		add: header
		withConstraints: [ :c | c height: header headerHeight ]
]

{ #category : 'instance creation' }
SpkTHeader >> newLayout [

	"Everything with a header is vertical, and not an accordian."

	^ SpkBoxLayout newVertical
		  color: Color veryVeryDarkGray;
		  yourself
]
