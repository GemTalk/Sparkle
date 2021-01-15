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

{ #category : 'running' }
SpkExplorerBasicInMemoryTest >> testOpenExplorer [

	"No error? No problem."

	self assert: explorerPresenter class equals: SpkExplorerWindow
]
