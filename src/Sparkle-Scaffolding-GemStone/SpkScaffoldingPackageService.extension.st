Extension { #name : 'SpkScaffoldingPackageService' }

{ #category : '*sparkle-scaffolding-gemstone' }
SpkScaffoldingPackageService >> initializeService [
	self rowanService: (self rowanService name: name) update
]
