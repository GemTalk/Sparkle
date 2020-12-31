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

{ #category : 'initialization' }
SpkGitServiceServer >> initializeGitClientCode [
	"remove when working"
	branchName := 'fnoodle'.
	sha := 'fnoodlySha'.
]
