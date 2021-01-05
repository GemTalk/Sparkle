Class {
	#name : 'SpkGitServiceServer',
	#superclass : 'SpkGitService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkGitServiceServer >> initializeGit [
	| rwProject |
	(rwProject := GsSession currentSession resolveSymbol: #'RwProject')
		ifNotNil: [ 
			branchName := (rwProject value newNamed: name) currentBranchName.
			sha := (rwProject value newNamed: name) loadedCommitId ]
]
