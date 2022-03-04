"
A trait for Sparkle presenters that have headers, such as panes and some sub-panes.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	header:		<SpkHeader>

"
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
