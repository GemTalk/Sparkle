Class {
	#name : 'SpkGitServiceClient',
	#superclass : 'SpkGitService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialize' }
SpkGitServiceClient >> initializeGit [ 
	remoteSelf initializeGit
]

{ #category : 'initialize' }
SpkGitServiceClient >> initializeGitOn: repositoryName [

	name := repositoryName.
	remoteSelf initializeGit
]
