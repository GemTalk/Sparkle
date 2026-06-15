Class {
	#name : 'SpkTonelFileTool',
	#superclass : 'SpkTool',
	#instVars : [
		'file'
	],
	#category : 'Sparkle-TonelBrowser-Tools-Tools',
	#package : 'Sparkle-TonelBrowser-Tools',
	#tag : 'Tools'
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

{ #category : 'printing' }
SpkTonelFileTool >> printOn: aStream [

	super printOn: aStream.
	aStream
		<< ': ';
		<< file basename
]
