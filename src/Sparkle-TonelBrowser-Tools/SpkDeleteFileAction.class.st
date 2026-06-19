Class {
	#name : 'SpkDeleteFileAction',
	#superclass : 'SpkAction',
	#instVars : [
		'fileReference',
		'fileModel'
	],
	#category : 'Sparkle-TonelBrowser-Tools-Actions',
	#package : 'Sparkle-TonelBrowser-Tools',
	#tag : 'Actions'
}

{ #category : 'accessing' }
SpkDeleteFileAction >> name [

	^ 'Delete file'
]

{ #category : 'accessing' }
SpkDeleteFileAction >> performAction [

	fileReference := target fileReference.
	fileModel := target fileModel.
	target _deleteFile
]

{ #category : 'accessing' }
SpkDeleteFileAction >> undoAction [

	target _recreateFile
]
