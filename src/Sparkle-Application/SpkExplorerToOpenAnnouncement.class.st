Class {
	#name : 'SpkExplorerToOpenAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'explorerLayoutService'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'accessing' }
SpkExplorerToOpenAnnouncement >> explorerLayoutService [

	^ explorerLayoutService
]

{ #category : 'accessing' }
SpkExplorerToOpenAnnouncement >> explorerLayoutService: anObject [

	explorerLayoutService := anObject
]
