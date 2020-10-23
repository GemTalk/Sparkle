Class {
	#name : 'SpkTestExplorerServiceClient',
	#superclass : 'SpkExplorerServiceClient',
	#category : 'Sparkle-Test-Pharo'
}

{ #category : 'tests' }
SpkTestExplorerServiceClient class >> testExplorer1 [

	^ self new
		  addPane: SpkTestInspectorServiceClient cuddles;
		  yourself
]
