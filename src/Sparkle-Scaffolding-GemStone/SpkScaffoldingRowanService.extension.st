Extension { #name : 'SpkScaffoldingRowanService' }

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingRowanService >> postUpdate [

	super postUpdate. 
	self rowanService asRSR. 
	RowanCommandResult clearResults
]
