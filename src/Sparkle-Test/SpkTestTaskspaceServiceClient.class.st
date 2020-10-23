Class {
	#name : 'SpkTestTaskspaceServiceClient',
	#superclass : 'SpkTaskspaceServiceClient',
	#category : 'Sparkle-Test-Test Services'
}

{ #category : 'tests' }
SpkTestTaskspaceServiceClient class >> testTaskspace1 [

	^ self new
		  addExplorer: SpkTestExplorerServiceClient testExplorer1;
		  yourself
]
