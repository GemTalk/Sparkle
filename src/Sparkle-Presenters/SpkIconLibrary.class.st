"
Stores Sparkle-specific icons.
If an icon is requested whose name is not one of the Sparkle-specific names, try to get that icon from the Pharo theme.

"
Class {
	#name : 'SpkIconLibrary',
	#superclass : 'Object',
	#instVars : [
		'icons'
	],
	#classVars : [
		'Current'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'initialization' }
SpkIconLibrary class >> current [
	^ Current
]

{ #category : 'initialization' }
SpkIconLibrary class >> loadFromGitClone [

	| repository repositoryPath  |
	repository := IceRepository registeredRepositoryIncludingPackage: self class package.
	repositoryPath := repository location asPath.
	self loadFromPath: repositoryPath
]

{ #category : 'initialization' }
SpkIconLibrary class >> loadFromPath: aPath [

	"Blow away any current library and re-load from a local filesystem path."

	Current := self new.
	Current initializeFromPath: aPath
]

{ #category : 'accessing' }
SpkIconLibrary >> iconNamed: aSymbol [

	^ icons at: aSymbol ifAbsent: [ 
		  Smalltalk ui icons
			  iconNamed: aSymbol
			  ifNone: [ UITheme current forms at: aSymbol ] ]
]

{ #category : 'initialization' }
SpkIconLibrary >> initializeFromPath: repoPath [

	| path directory files |
	path := repoPath / 'icons/png/'.
	directory := path asFileReference.
	files := directory allChildrenMatching: '*.png'.
	icons := Dictionary new.
	files do: [ :eachFile | 
		icons at: eachFile base asSymbol put: (self readPngFrom: eachFile) ]
]

{ #category : 'initialization' }
SpkIconLibrary >> readPngFrom: aReference [
	^ aReference binaryReadStreamDo: [ :stream | 
		  PNGReadWriter formFromStream: stream ]
]
