Class {
	#name : 'SpkTestExplorerServiceClient',
	#superclass : 'SpkExplorerServiceClient',
	#category : 'Sparkle-Test-Test Services'
}

{ #category : 'tests' }
SpkTestExplorerServiceClient class >> testExplorer1 [

	| explorerLayout columnLayout paneLayout pane |
	pane := SpkTestInspectorServiceClient cuddles.
	paneLayout := SpkPaneLayoutServiceClient new.
	paneLayout
		paneService: pane;
		relativeHeight: 1;
		paneCoordinate: SpkPaneCoordinate new , 0.5.
	columnLayout := SpkColumnLayoutServiceClient new.
	columnLayout
		addPaneLayout: paneLayout;
		relativeWidth: 1.

	explorerLayout := SpkExplorerLayoutServiceClient new.
	explorerLayout
		addColumnLayout: columnLayout;
		addColumnLayout: SpkColumnLayoutServiceClient new.

	^ self new
		  layoutService: explorerLayout;
		  addPane: pane;
		  yourself
]

{ #category : 'initialization' }
SpkTestExplorerServiceClient >> defaultLayout [

	^ super defaultLayout
		  height: 600;
		  yourself
]
