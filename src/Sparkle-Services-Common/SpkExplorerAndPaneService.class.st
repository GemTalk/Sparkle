Class {
	#name : 'SpkExplorerAndPaneService',
	#superclass : 'RsrService',
	#instVars : [
		'explorer',
		'pane'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkExplorerAndPaneService class >> templateClassName [

	^ #SpkExplorerAndPaneService
]

{ #category : 'accessing' }
SpkExplorerAndPaneService >> explorer [

	^ explorer
]

{ #category : 'accessing' }
SpkExplorerAndPaneService >> explorer: anObject [

	explorer := anObject
]

{ #category : 'accessing' }
SpkExplorerAndPaneService >> pane [

	^ pane
]

{ #category : 'accessing' }
SpkExplorerAndPaneService >> pane: anObject [

	pane := anObject
]
