Class {
	#name : 'SpkExplorerBasicInMemoryTest',
	#superclass : 'SpkExplorerBasicTest',
	#category : 'Sparkle-UiTest'
}

{ #category : 'initialization' }
SpkExplorerBasicInMemoryTest >> initializeConnection [

	DefaultExecutionEnvironment beActiveDuring: [ 
		connection := RsrInMemoryConnectionSpecification new connect ].
	^ connection
]

{ #category : 'running' }
SpkExplorerBasicInMemoryTest >> testColumnAndPaneQuantity [

	"Default should have one column with one pane"

	self
		assert: explorerPresenter columns size equals: 1;
		assert: explorerPresenter columns first panes size equals: 1
]

{ #category : 'running' }
SpkExplorerBasicInMemoryTest >> testInspectorPaneOop [

	| inspector |
	inspector := self firstPaneOf: self firstColumn.
	self
		assert: inspector header oopLabel label
		equals: nil identityHash hex
]

{ #category : 'running' }
SpkExplorerBasicInMemoryTest >> testInstvarClasses [

	self
		assert: explorerPresenter model class
		equals: SpkExplorerServiceClient;
		assert: explorerPresenter window class equals: SpWindowPresenter;
		assert: explorerPresenter columns class equals: OrderedCollection
]

{ #category : 'running' }
SpkExplorerBasicInMemoryTest >> testOpenExplorer [

	self assert: explorerPresenter class equals: SpkExplorerWindow
]
