Class {
	#name : 'SpkGitServiceClient',
	#superclass : 'SpkGitService',
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialize' }
SpkGitServiceClient >> initializeGitOn: repositoryName [

	name := repositoryName.
	remoteSelf initializeGit wait.
]
