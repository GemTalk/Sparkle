Class {
	#name : 'SpkGitServiceServer',
	#superclass : 'SpkGitService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkGitServiceServer >> initializeGit [ 
	branchName := (RwProject newNamed: name) currentBranchName.
	sha := (RwProject newNamed: name) loadedCommitId.
]
