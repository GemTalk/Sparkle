Class {
	#name : 'SpkTonelDirectoryListTool',
	#superclass : 'SpkPaneTool',
	#instVars : [
		'directory',
		'fileTools'
	],
	#category : 'Sparkle-TonelBrowser-Tools',
	#package : 'Sparkle-TonelBrowser-Tools'
}

{ #category : 'instance creation' }
SpkTonelDirectoryListTool class >> newOnPath: pathString inExplorer: xTool [

	| fileRef toolClass |
	fileRef := pathString asFileReference.
	toolClass := (fileRef exists and: [ fileRef isDirectory ])
		             ifTrue: [ self ]
		             ifFalse: [ SpkTonelBadDirectoryTool ].
	^ (toolClass newInTaskspace: xTool taskspaceTool)
		  directory: fileRef;
		  initializeInExplorer: xTool;
		  yourself
]
