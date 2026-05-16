Class {
	#name : 'SpkTonelFileTool',
	#superclass : 'SpkTool',
	#instVars : [
		'file'
	],
	#category : 'Sparkle-TonelBrowser-Tools',
	#package : 'Sparkle-TonelBrowser-Tools'
}

{ #category : 'accessing' }
SpkTonelFileTool >> filename [
	"Answer the simple name (e.g. 'Object.st') of the file I am responsible for."

	^ file basename
]

{ #category : 'initialization' }
SpkTonelFileTool >> initializeForFileReference: aFileReference [
	"Initially, just remember what file I am for. 
	Reading and parsing the file is done lazily."

	file := aFileReference
]
