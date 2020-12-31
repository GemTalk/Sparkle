Class {
	#name : 'SpkGitService',
	#superclass : 'RsrService',
	#instVars : [
		'name',
		'branchName',
		'sha'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkGitService class >> templateClassName [

	^ 'SpkGitService'
]

{ #category : 'accessing' }
SpkGitService >> branchName [

	^ branchName
]

{ #category : 'accessing' }
SpkGitService >> branchName: anObject [

	branchName := anObject
]

{ #category : 'accessing' }
SpkGitService >> name [

	^ name
]

{ #category : 'accessing' }
SpkGitService >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SpkGitService >> sha [

	^ sha
]

{ #category : 'accessing' }
SpkGitService >> sha: anObject [

	sha := anObject
]
