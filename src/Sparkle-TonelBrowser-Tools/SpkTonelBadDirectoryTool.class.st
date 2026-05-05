"
The tool that represents a non-existent path, or a path that does not name a directory.
"
Class {
	#name : 'SpkTonelBadDirectoryTool',
	#superclass : 'SpkPaneTool',
	#instVars : [
		'directory'
	],
	#category : 'Sparkle-TonelBrowser-Tools',
	#package : 'Sparkle-TonelBrowser-Tools'
}

{ #category : 'accessing' }
SpkTonelBadDirectoryTool >> directory [

	^ directory
]

{ #category : 'accessing' }
SpkTonelBadDirectoryTool >> directory: anObject [

	directory := anObject
]
