Class {
	#name : 'SpkTaskspaceResponseAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'service'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'instance creation' }
SpkTaskspaceResponseAnnouncement class >> service: aService [

	^self new
		service: aService;
		yourself
]

{ #category : 'accessing' }
SpkTaskspaceResponseAnnouncement >> service [

	^ service
]

{ #category : 'accessing' }
SpkTaskspaceResponseAnnouncement >> service: anObject [

	service := anObject
]
