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

{ #category : 'as yet unclassified' }
SpkTonelDirectoryListTool >> fileToolForFile: aFileReference [

	^ (SpkTonelFileTool newInTaskspace: taskspaceTool)
		  initializeForFileReference: aFileReference;
		  yourself
]

{ #category : 'enumerating' }
SpkTonelDirectoryListTool >> fileToolsDo: aBlock [

	^ fileTools do: aBlock
]

{ #category : 'private' }
SpkTonelDirectoryListTool >> findDewFiles [

	^ self findFilesWithExtension: 'dew'
]

{ #category : 'private' }
SpkTonelDirectoryListTool >> findFilesWithExtension: extensionString [
	"Answer a Set of FileReference of all files in my
	 directory that have the given extension (without the $.)"

	| entries |
	entries := directory entries select: [ :each |
		           each extension = extensionString ].
	^ entries collect: [ :each | each asFileReference ]
]

{ #category : 'private' }
SpkTonelDirectoryListTool >> findStFiles [

	^ self findFilesWithExtension: 'st'
]

{ #category : 'initialization' }
SpkTonelDirectoryListTool >> initializeInExplorer: xTool [

	| tonelFiles |
	super initializeInExplorer: xTool.

	tonelFiles := self findStFiles , self findDewFiles.
	fileTools := tonelFiles collect: [ :each |
		             self fileToolForFile: each ]
]
