"
Simple tests of the explorer window.
Abstract -- subclasses specialize on type of connection.
"
Class {
	#name : 'SpkExplorerBasicTest',
	#superclass : 'SpkUiTest',
	#instVars : [
		'explorerPresenter'
	],
	#category : 'Sparkle-UiTest'
}

{ #category : 'testing' }
SpkExplorerBasicTest class >> isAbstract [ 
	^ self == SpkExplorerBasicTest
]

{ #category : 'support' }
SpkExplorerBasicTest >> closeExplorer [

	explorerPresenter close
]

{ #category : 'support' }
SpkExplorerBasicTest >> firstColumn [

	^ explorerPresenter columns first
]

{ #category : 'support' }
SpkExplorerBasicTest >> firstPaneOf: aColumn [

	^ aColumn panes first
]

{ #category : 'running' }
SpkExplorerBasicTest >> newEvaluator [

	| taskspace |
	taskspace := SpkTaskspace forConnection: self connection.
	taskspace
		when: SpkExplorerOpenedAnnouncement
		send: #windowOpened:
		to: self.
	taskspace newEvaluator.
	(uiWaitingSemaphore wait: 5 seconds) ifTrue: [ 
		self fail: 'Explorer open timed out.' ]
]

{ #category : 'running' }
SpkExplorerBasicTest >> setUp [
	super setUp.
	self connection. "Force lazy initialization if we don't already have a connection."
	self newEvaluator
]

{ #category : 'running' }
SpkExplorerBasicTest >> tearDown [
	self closeExplorer.
	super tearDown
]

{ #category : 'support' }
SpkExplorerBasicTest >> windowOpened: announcement [
	explorerPresenter := announcement explorer.
	uiWaitingSemaphore signal
]
