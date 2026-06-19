Class {
	#name : 'SpkTonelFileTool',
	#superclass : 'SpkTool',
	#instVars : [
		'fileModel',
		'fileReference',
		'explorerTool',
		'parentTool'
	],
	#category : 'Sparkle-TonelBrowser-Tools-Tools',
	#package : 'Sparkle-TonelBrowser-Tools',
	#tag : 'Tools'
}

{ #category : 'private to actions' }
SpkTonelFileTool >> _deleteFile [
	"Truly delete the file"

	fileReference delete.
	parentTool _updated
]

{ #category : 'private to actions' }
SpkTonelFileTool >> _recreateFile [
	"Create the file and restore its contents."

	| stream |
	fileReference createFile.
	stream := fileReference writeStream.
	fileModel writeOn: stream.
	stream close.
	parentTool _updated
]

{ #category : 'accessing' }
SpkTonelFileTool >> classDefinition [

	^ fileModel classDefinition
]

{ #category : 'accessing' }
SpkTonelFileTool >> classMethods [

	^ fileModel classMethods
]

{ #category : 'actions' }
SpkTonelFileTool >> deleteFile [

	| action |
	action := SpkDeleteFileAction forTarget: self.
	explorerTool performAction: action
]

{ #category : 'accessing' }
SpkTonelFileTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'accessing' }
SpkTonelFileTool >> fileModel [

	^ fileModel
]

{ #category : 'accessing' }
SpkTonelFileTool >> fileReference [

	^ fileReference
]

{ #category : 'accessing' }
SpkTonelFileTool >> filename [
	"Answer the simple name (e.g. 'Object.st') of the file I am responsible for."

	^ fileReference basename
]

{ #category : 'initialization' }
SpkTonelFileTool >> initializeForFileReference: aFileReference [
	"Initially, just remember what file I am for. 
	Reading and parsing the file is done lazily."

	fileReference := aFileReference.
	fileModel := TnFile parsedFromFile: fileReference
]

{ #category : 'accessing' }
SpkTonelFileTool >> instanceMethods [

	^ fileModel instanceMethods
]

{ #category : 'accessing' }
SpkTonelFileTool >> parentTool: anObject [

	parentTool := anObject
]

{ #category : 'printing' }
SpkTonelFileTool >> printOn: aStream [

	super printOn: aStream.
	aStream
		<< ': ';
		<< fileReference basename
]
