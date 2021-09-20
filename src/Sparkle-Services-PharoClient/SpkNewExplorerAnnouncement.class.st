Class {
	#name : 'SpkNewExplorerAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'service'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'instance creation' }
SpkNewExplorerAnnouncement class >> service: anExplorerLayoutService [

	^self new
		service: anExplorerLayoutService;
		yourself
]

{ #category : 'accessing' }
SpkNewExplorerAnnouncement >> service [

	^ service
]

{ #category : 'accessing' }
SpkNewExplorerAnnouncement >> service: anObject [

	service := anObject
]
