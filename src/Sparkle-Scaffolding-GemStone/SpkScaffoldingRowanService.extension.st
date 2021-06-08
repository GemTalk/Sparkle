Extension { #name : 'SpkScaffoldingRowanService' }

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingRowanService >> newRowanService [
	^ RowanService new
]

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingRowanService >> postUpdate [
	super postUpdate. 
	rsrRowanService := self rowanService asRSR. 
	RowanCommandResult clearResults.
]

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingRowanService >> rowanService [
	^ (self dynamicInstVarAt: #'rowanService')
		ifNil: [ self rowanService: self newRowanService ]
]

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingRowanService >> rowanService: anObject [
	self dynamicInstVarAt: #'rowanService' put: anObject
]
