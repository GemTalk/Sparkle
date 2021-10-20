Class {
	#name : 'SpkPaneWithList',
	#superclass : 'SpkPane',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkPaneWithList >> coordinate: aCoordinate [

	coordinate = aCoordinate
		ifTrue: [^self].
	super coordinate: aCoordinate.
	self updateLinkedPaneCoordinates
]

{ #category : 'accessing' }
SpkPaneWithList >> linkedPanes [

	^ self panesLinkedToListItems
]
