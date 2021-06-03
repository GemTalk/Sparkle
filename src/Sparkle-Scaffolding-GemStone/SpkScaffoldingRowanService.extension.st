Extension { #name : 'SpkScaffoldingRowanService' }

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingRowanService >> newRowanService [
	^ RowanService new
]

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingRowanService >> postUpdate [

	super postUpdate. 
	rsrRowanService := self rowanService asRSR. 
	RowanCommandResult clearResults
]
