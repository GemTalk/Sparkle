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
		'linkedPane',
		'coordinate'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'actions' }
SpkTLinkedPane >> clearLinkedPane [

	linkedPane ifNotNil: [ 
		linkedPane linkedFrom: nil.
		linkedPane := nil.
		self linkedPaneChanged ]
]

{ #category : 'actions' }
SpkTLinkedPane >> closeLinkedPane [

	linkedPane ifNotNil: [ :p | 
		p close.
		linkedPane ifNotNil: [ 
			self error: 'Closing my linked pane should have unlinked it' ] ]
]

{ #category : 'refreshing' }
SpkTLinkedPane >> coordinate: aCoordinate [

	coordinate := aCoordinate.
	linkedPane ifNotNil: [ linkedPane coordinate: coordinate ]
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
	aPane linkedFrom: self.
	self linkedPaneChanged
]

{ #category : 'updating' }
SpkTLinkedPane >> linkedPaneChanged [

	"I've gained, lost, or changed my linked pane.
	Do any necessary work, which by default is no work"
]

{ #category : 'actions' }
SpkTLinkedPane >> openLinkedPane: aPaneService [

	"Create and open a pane in the next column."

	| nextRightColumn newPane |
	nextRightColumn := self column nextRightColumn.
	"Ask the column, since it must own the new pane."
	newPane := nextRightColumn presenterForService: aPaneService.
	newPane coordinate: coordinate.
	"Add before close so that the column doesn't become empty and remove itself"
	nextRightColumn add: newPane.
	self
		closeLinkedPane;
		linkedPane: newPane
]
