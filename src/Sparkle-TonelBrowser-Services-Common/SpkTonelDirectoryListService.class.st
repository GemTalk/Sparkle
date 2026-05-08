"
dirName <String> The simple name of the directory being listed
stFilanemes <Array of String> The names, in alphabetical order, of files with .st extensions (class files)
dewFilenames <Array of String> The names, in alphabetical order, of files with .dew extensions (library files)
"
Class {
	#name : 'SpkTonelDirectoryListService',
	#superclass : 'RsrService',
	#instVars : [
		'dirName',
		'stFilenames',
		'dewFilenames'
	],
	#category : 'Sparkle-TonelBrowser-Services-Common',
	#package : 'Sparkle-TonelBrowser-Services-Common'
}

{ #category : 'accessing' }
SpkTonelDirectoryListService class >> templateClassName [

	^ #SpkTonelDirectoryListService
]

{ #category : 'accessing' }
SpkTonelDirectoryListService >> dewFilenames [

	^ dewFilenames
]

{ #category : 'accessing' }
SpkTonelDirectoryListService >> dewFilenames: anObject [

	dewFilenames := anObject
]

{ #category : 'accessing' }
SpkTonelDirectoryListService >> dirName [

	^ dirName
]

{ #category : 'accessing' }
SpkTonelDirectoryListService >> dirName: anObject [

	dirName := anObject
]

{ #category : 'accessing' }
SpkTonelDirectoryListService >> stFilenames [

	^ stFilenames
]

{ #category : 'accessing' }
SpkTonelDirectoryListService >> stFilenames: anObject [

	stFilenames := anObject
]
