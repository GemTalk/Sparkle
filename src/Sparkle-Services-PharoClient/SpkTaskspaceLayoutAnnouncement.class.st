Class {
	#name : 'SpkTaskspaceLayoutAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'taskspaceLayoutService'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'accessing' }
SpkTaskspaceLayoutAnnouncement >> taskspaceLayoutService [

	^ taskspaceLayoutService
]

{ #category : 'accessing' }
SpkTaskspaceLayoutAnnouncement >> taskspaceLayoutService: anObject [

	taskspaceLayoutService := anObject
]
