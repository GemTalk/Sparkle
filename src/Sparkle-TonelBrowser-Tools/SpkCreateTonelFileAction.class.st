Class {
	#name : 'SpkCreateTonelFileAction',
	#superclass : 'SpkAction',
	#instVars : [
		'fileReference',
		'filename'
	],
	#category : 'Sparkle-TonelBrowser-Tools-Actions',
	#package : 'Sparkle-TonelBrowser-Tools',
	#tag : 'Actions'
}

{ #category : 'accessing' }
SpkCreateTonelFileAction >> filename: anObject [

	filename := anObject
]

{ #category : 'accessing' }
SpkCreateTonelFileAction >> name [
	^ 'Create file'
]

{ #category : 'public' }
SpkCreateTonelFileAction >> performAction [

	fileReference := target _createFileNamed: filename
]

{ #category : 'public' }
SpkCreateTonelFileAction >> undoAction [

	target _trulyDeleteFile: fileReference.
	fileReference := nil
]
