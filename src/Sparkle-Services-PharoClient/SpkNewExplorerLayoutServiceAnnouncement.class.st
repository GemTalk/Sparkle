Class {
	#name : 'SpkNewExplorerLayoutServiceAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'service'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'instance creation' }
SpkNewExplorerLayoutServiceAnnouncement class >> service: anExplorerLayoutService [

	^self new
		service: anExplorerLayoutService;
		yourself
]

{ #category : 'accessing' }
SpkNewExplorerLayoutServiceAnnouncement >> service [

	^ service
]

{ #category : 'accessing' }
SpkNewExplorerLayoutServiceAnnouncement >> service: anObject [

	service := anObject
]
