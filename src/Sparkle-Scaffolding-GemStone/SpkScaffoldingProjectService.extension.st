Extension { #name : 'SpkScaffoldingProjectService' }

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingProjectService >> initializeService [
	self rowanService: (self rowanService name: name) update
]
