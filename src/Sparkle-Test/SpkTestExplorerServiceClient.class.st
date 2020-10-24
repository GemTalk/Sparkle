Class {
	#name : 'SpkTestExplorerServiceClient',
	#superclass : 'SpkExplorerServiceClient',
	#category : 'Sparkle-Test-Test Services'
}

{ #category : 'tests' }
SpkTestExplorerServiceClient class >> testExplorer1 [

	^ self new
		  addPane: SpkTestInspectorServiceClient cuddles;
		  yourself
]

{ #category : 'accessing' }
SpkTestExplorerServiceClient >> addPane: aPaneService [

	super addPane: aPaneService.
	layoutService addPane: aPaneService beforePosition: 1 inColumn: 1
]

{ #category : 'initialization' }
SpkTestExplorerServiceClient >> defaultLayout [

	^ super defaultLayout
		  height: 600;
		  yourself
]
