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

{ #category : 'tests' }
SpkExplorerBasicInMemoryTest >> testColumnAndPaneQuantity [

	"Default should have one column with one pane"

	self
		assert: explorerPresenter columns size equals: 1;
		assert: explorerPresenter columns first panes size equals: 1
]

{ #category : 'tests' }
SpkExplorerBasicInMemoryTest >> testInspectorPaneOop [

	| inspector |
	inspector := self firstPaneOf: self firstColumn.
	self
		assert: inspector header oopLabel label
		equals: nil identityHash hex
]

{ #category : 'tests' }
SpkExplorerBasicInMemoryTest >> testInstvarClasses [

	self
		assert: explorerPresenter model class
		equals: SpkExplorerServiceClient;
		assert: explorerPresenter window class equals: SpkWindowPresenter;
		assert: explorerPresenter columns class equals: OrderedCollection
]

{ #category : 'tests' }
SpkExplorerBasicInMemoryTest >> testOpenExplorer [

	self assert: explorerPresenter class equals: SpkExplorerWindow
]
