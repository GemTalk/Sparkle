Class {
	#name : 'SpkContentsChangedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'newContents'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'accessing' }
SpkContentsChangedAnnouncement >> newContents [
	^ newContents
]

{ #category : 'accessing' }
SpkContentsChangedAnnouncement >> newContents: anObject [
	newContents := anObject
]
