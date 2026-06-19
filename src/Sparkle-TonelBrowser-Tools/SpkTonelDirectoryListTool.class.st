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
	#category : 'Sparkle-TonelBrowser-Tools-Tools',
	#package : 'Sparkle-TonelBrowser-Tools',
	#tag : 'Tools'
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

{ #category : 'private to actions' }
SpkTonelDirectoryListTool >> _createFileNamed: filename [
	"Ensureing that the file does not exist is the sender's responsibility."

	| fileReference model stream |
	fileReference := directory / filename.
	fileReference createFile.
	model := TnClassDefinitionFile forClassNamed:
		         (self classNameFromFilename: filename).
	stream := fileReference writeStream.
	model writeOn: stream.
	stream close.
	^ fileReference
]

{ #category : 'private to actions' }
SpkTonelDirectoryListTool >> _trulyDeleteFile: fileReference [
	"Ensureing that the file does not exist is the sender's responsibility."

	fileReference delete
]

{ #category : 'private to actions' }
SpkTonelDirectoryListTool >> _updated [

	self
		refreshFromFileSystem;
		announceUpdate
]

{ #category : 'private' }
SpkTonelDirectoryListTool >> classNameFromFilename: basename [

	| suffix |
	suffix := '.class.st'.
	(basename endsWith: suffix) ifFalse: [
		^ self error: 'Class file name must end with ' , suffix ].
	^ basename copyFrom: 1 to: basename size - suffix size
]

{ #category : 'actions' }
SpkTonelDirectoryListTool >> createClassFile [
	"Find an unused name and create, undoably, an empty class file."

	| newFilename action |
	newFilename := self nameForNewClassFile.
	action := SpkCreateTonelFileAction forTarget: self.
	action filename: newFilename.
	explorerTool performAction: action.
	self _updated
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

{ #category : 'actions' }
SpkTonelDirectoryListTool >> fileToolForFile: aFileReference [

	^ (SpkTonelFileTool newInTaskspace: taskspaceTool)
		  initializeForFileReference: aFileReference;
		  parentTool: self;
		  explorerTool: explorerTool;
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
SpkTonelDirectoryListTool >> initialize [

	super initialize.
	fileTools := Dictionary new
]

{ #category : 'initialization' }
SpkTonelDirectoryListTool >> initializeInExplorer: xTool [

	super initializeInExplorer: xTool.
	self refreshFromFileSystem
]

{ #category : 'private' }
SpkTonelDirectoryListTool >> nameForNewClassFile [
	"Find and answer an unused name in my directory, the name of the form:
	NewClass1.st, NewClass2.st, and so on, whatever is the first unused name."

	| suffix suffixSize fileEntries classNames newFileNumber newFileRef |
	suffix := '.class.st'.
	suffixSize := suffix size.
	fileEntries := directory entries select: [ :entry |
		               entry isFile and: [ entry basename endsWith: suffix ] ].
	classNames := Set new: fileEntries size.
	fileEntries do: [ :entry |
		| basename classNameSize |
		basename := entry basename.
		classNameSize := basename size - suffixSize.
		classNameSize > 0 ifTrue: [
			classNames add: (basename copyFrom: 1 to: classNameSize) ] ].
	newFileNumber := 1.
	[
	newFileRef := directory
	              / ('NewClass' , newFileNumber printString , suffix).
	newFileRef exists ] whileTrue: [ newFileNumber := newFileNumber + 1 ].
	^ newFileRef basename
]

{ #category : 'printing' }
SpkTonelDirectoryListTool >> printOn: aStream [

	super printOn: aStream.
	aStream
		<< ': ';
		<< directory basename
]

{ #category : 'initialization' }
SpkTonelDirectoryListTool >> refreshFromFileSystem [

	| tonelFiles filesByName oldFileTools |
	tonelFiles := self findStFiles , self findDewFiles.
	filesByName := Dictionary new: tonelFiles size.
	tonelFiles do: [ :each | filesByName at: each basename put: each ].
	oldFileTools := fileTools.
	fileTools := Dictionary new: tonelFiles size.
	tonelFiles do: [ :file |
		| name |
		name := file basename.
		oldFileTools
			at: name
			ifPresent: [ :tool | fileTools at: name put: tool ]
			ifAbsent: [ fileTools at: name put: (self fileToolForFile: file) ] ]
]
