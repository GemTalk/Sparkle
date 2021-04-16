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
SpkIconLibrary class >> loadFromLocalSrcUrlString: urlString [
	"Blow away any current library and re-load from a local filesystem path.
	urlString is of the form 'gitlocal://<path>/src'
	We just want the path"

	| startIndex endIndex pathString |
	startIndex := (urlString indexOfSubCollection: '//' startingAt: 1)
	              + 2.
	endIndex := urlString size - 4.
	pathString := urlString copyFrom: startIndex to: endIndex.
	Current := self new.
	Current initializeFromDirectory: pathString
]

{ #category : 'accessing' }
SpkIconLibrary >> iconNamed: aSymbol [

	^ icons at: aSymbol ifAbsent: [ 
		  Smalltalk ui icons
			  iconNamed: aSymbol
			  ifNone: [ UITheme current forms at: aSymbol ] ]
]

{ #category : 'initialization' }
SpkIconLibrary >> initializeFromDirectory: pathString [
	| path directory files |
	path := (Path from: pathString) / 'icons/png/'.
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
