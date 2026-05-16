"
dirName <String> The simple name of the directory being listed
stFilanemes <Array of String> The names, in alphabetical order, of files with .st extensions (class files)
dewFilenames <Array of String> The names, in alphabetical order, of files with .dew extensions (library files)
"
Class {
	#name : 'SpkTonelDirectoryListService',
	#superclass : 'RsrService',
	#instVars : [
		'dirName'
	],
	#category : 'Sparkle-TonelBrowser-Services-Common',
	#package : 'Sparkle-TonelBrowser-Services-Common'
}

{ #category : 'accessing' }
SpkTonelDirectoryListService class >> templateClassName [

	^ #SpkTonelDirectoryListService
]

{ #category : 'accessing' }
SpkTonelDirectoryListService >> dirName [

	^ dirName
]

{ #category : 'accessing' }
SpkTonelDirectoryListService >> dirName: anObject [

	dirName := anObject
]
