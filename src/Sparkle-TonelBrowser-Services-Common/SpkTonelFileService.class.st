"
A service for communicating about a single Tonel file.
#name <String> The filename, unique within its parent directory
"
Class {
	#name : 'SpkTonelFileService',
	#superclass : 'RsrService',
	#instVars : [
		'filename',
		'instanceMethodServices',
		'classDefinitionService',
		'classMethodServices'
	],
	#category : 'Sparkle-TonelBrowser-Services-Common',
	#package : 'Sparkle-TonelBrowser-Services-Common'
}

{ #category : 'accessing' }
SpkTonelFileService class >> templateClassName [

	^ #SpkTonelFileService
]

{ #category : 'accessing' }
SpkTonelFileService >> filename [

	^ filename
]

{ #category : 'accessing' }
SpkTonelFileService >> filename: anObject [

	filename := anObject
]

{ #category : 'printing' }
SpkTonelFileService >> printOn: aStream [

	super printOn: aStream.
	aStream
		<< ': ';
		<< filename printString
]
