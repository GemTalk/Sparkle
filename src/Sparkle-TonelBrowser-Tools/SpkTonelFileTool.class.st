Class {
	#name : 'SpkTonelFileTool',
	#superclass : 'SpkTool',
	#instVars : [
		'fileModel',
		'fileReference'
	],
	#category : 'Sparkle-TonelBrowser-Tools-Tools',
	#package : 'Sparkle-TonelBrowser-Tools',
	#tag : 'Tools'
}

{ #category : 'accessing' }
SpkTonelFileTool >> filename [
	"Answer the simple name (e.g. 'Object.st') of the file I am responsible for."

	^ fileReference basename
]

{ #category : 'initialization' }
SpkTonelFileTool >> initializeForFileReference: aFileReference [
	"Initially, just remember what file I am for. 
	Reading and parsing the file is done lazily."

	fileReference := aFileReference
]

{ #category : 'printing' }
SpkTonelFileTool >> printOn: aStream [

	super printOn: aStream.
	aStream
		<< ': ';
		<< fileReference basename
]
