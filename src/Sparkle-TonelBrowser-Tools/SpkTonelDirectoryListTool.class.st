"
A tool for browsing a directory of Tonel files. The files can be a mixture of class (.st) files, or low-level library routine files (.dew)

#directory is a FileReference to the directory I operate on.
#stFiles and #dewFiles are Dictionaries of baseName -> FileReference, of files that have a .st and .dew name extension.


"
Class {
	#name : 'SpkTonelDirectoryListTool',
	#superclass : 'SpkPaneTool',
	#instVars : [
		'directory',
		'stFiles',
		'dewFiles'
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

{ #category : 'accessing' }
SpkTonelDirectoryListTool >> dewFilenames [

	^ dewFiles keys
]

{ #category : 'accessing' }
SpkTonelDirectoryListTool >> dirName [

	^ directory basename
]

{ #category : 'accessing' }
SpkTonelDirectoryListTool >> directory [

	^ directory
]

{ #category : 'accessing' }
SpkTonelDirectoryListTool >> directory: anObject [

	directory := anObject
]

{ #category : 'private' }
SpkTonelDirectoryListTool >> findDewFiles [

	^ self findFilesWithExtension: 'dew'
]

{ #category : 'private' }
SpkTonelDirectoryListTool >> findFilesWithExtension: extensionString [
	"Answer a dictionary of simpleName -> FileReference of all files in my
	 directory that have the given extension (without the $.)"

	| entries result |
	entries := directory entries select: [ :each |
		           each extension = extensionString ].
	result := Dictionary new: entries size.
	entries do: [ :entry |
		| ref |
		ref := entry asFileReference.
		result at: ref basename put: ref ].
	^ result
]

{ #category : 'private' }
SpkTonelDirectoryListTool >> findStFiles [

	^ self findFilesWithExtension: 'st'
]

{ #category : 'initialization' }
SpkTonelDirectoryListTool >> initializeInExplorer: xTool [

	super initializeInExplorer: xTool.
	stFiles := self findStFiles.
	dewFiles := self findDewFiles
]

{ #category : 'accessing' }
SpkTonelDirectoryListTool >> stFilenames [

	^ stFiles keys
]
