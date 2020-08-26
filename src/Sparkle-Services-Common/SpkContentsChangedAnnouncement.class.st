Class {
	#name : 'SpkContentsChangedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'newContents'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkContentsChangedAnnouncement >> newContents [
	^ newContents
]

{ #category : 'accessing' }
SpkContentsChangedAnnouncement >> newContents: anObject [
	newContents := anObject
]
