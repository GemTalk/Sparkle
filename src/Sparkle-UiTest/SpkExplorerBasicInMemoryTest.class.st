Class {
	#name : 'SpkExplorerBasicInMemoryTest',
	#superclass : 'SpkExplorerBasicTest',
	#category : 'Sparkle-UiTest'
}

{ #category : 'initialization' }
SpkExplorerBasicInMemoryTest >> initializeConnection [

	connection := RsrInMemoryConnectionSpecification new connect.
	^ connection
]
