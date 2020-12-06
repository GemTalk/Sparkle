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
		paneCoordinate: #( 0.5 ).
	columnLayout := SpkColumnLayoutServiceClient new.
	columnLayout
		addPaneLayout: paneLayout;
		relativeWidth: 1.

	explorerLayout := SpkExplorerLayoutServiceClient new.
	explorerLayout
		height: 600;
		addColumnLayout: columnLayout.

	^ self new
		  layoutService: explorerLayout;
		  addPaneService: pane;
		  yourself
]
