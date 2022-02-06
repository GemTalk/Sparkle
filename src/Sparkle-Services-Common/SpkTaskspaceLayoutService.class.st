Class {
	#name : 'SpkTaskspaceLayoutService',
	#superclass : 'RsrService',
	#instVars : [
		'taskspaceService',
		'explorerLayoutServices',
		'updatedServices'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkTaskspaceLayoutService class >> templateClassName [

	^ #SpkTaskspaceLayoutService
]

{ #category : 'accessing' }
SpkTaskspaceLayoutService >> explorerLayoutServices [

	^ explorerLayoutServices
]

{ #category : 'initialization' }
SpkTaskspaceLayoutService >> initialize [
	
	super initialize.
	explorerLayoutServices := Set new.
	updatedServices := Set new
]

{ #category : 'accessing' }
SpkTaskspaceLayoutService >> taskspaceService [

	^ taskspaceService
]

{ #category : 'accessing' }
SpkTaskspaceLayoutService >> updatedServices [
	^updatedServices
]

{ #category : 'accessing' }
SpkTaskspaceLayoutService >> updatedServices: object [
	updatedServices := object
]
