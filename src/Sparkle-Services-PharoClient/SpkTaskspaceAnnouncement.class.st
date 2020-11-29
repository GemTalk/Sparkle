Class {
	#name : 'SpkTaskspaceAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'taskspaceService'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'accessing' }
SpkTaskspaceAnnouncement >> taskspaceService [

	^ taskspaceService
]

{ #category : 'accessing' }
SpkTaskspaceAnnouncement >> taskspaceService: anObject [

	taskspaceService := anObject
]
