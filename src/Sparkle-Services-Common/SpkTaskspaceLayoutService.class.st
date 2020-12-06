Class {
	#name : 'SpkTaskspaceLayoutService',
	#superclass : 'RsrService',
	#instVars : [
		'taskspaceService',
		'explorerLayoutServices'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkTaskspaceLayoutService class >> templateClassName [

	^ #SpkTaskspaceLayoutService
]

{ #category : 'initialization' }
SpkTaskspaceLayoutService >> initialize [

	super initialize.
	explorerLayoutServices := Set new
]
