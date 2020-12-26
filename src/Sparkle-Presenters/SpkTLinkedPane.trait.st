"
A trait for presentation-layer objects that can have panes linked to them.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	linkedPane:		<SpkPane>


    Implementation Points

	 Panes know what object they are linked from. This will be nil for independent panes.
"
Trait {
	#name : 'SpkTLinkedPane',
	#instVars : [
		'linkedPane'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'as yet unclassified' }
SpkTLinkedPane >> clearLinkedPane [

	linkedPane ifNotNil: [ 
		linkedPane linkedFrom: nil.
		linkedPane := nil ]
]

{ #category : 'testing' }
SpkTLinkedPane >> hasLinkedPane [

	^ linkedPane notNil
]

{ #category : 'accessing' }
SpkTLinkedPane >> linkedPane [
	^ linkedPane
]

{ #category : 'accessing' }
SpkTLinkedPane >> linkedPane: aPane [

	linkedPane := aPane.
	aPane linkedFrom: self
]
