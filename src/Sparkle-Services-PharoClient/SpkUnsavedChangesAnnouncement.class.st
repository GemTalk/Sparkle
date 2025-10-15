Class {
	#name : 'SpkUnsavedChangesAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'hasUnsavedChanges'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements',
	#package : 'Sparkle-Services-PharoClient',
	#tag : 'Announcements'
}

{ #category : 'testing' }
SpkUnsavedChangesAnnouncement class >> hasUnsavedChanges: aBoolean [

	^ self new
		  hasUnsavedChanges: aBoolean;
		  yourself
]

{ #category : 'accessing' }
SpkUnsavedChangesAnnouncement >> hasUnsavedChanges [
	^ hasUnsavedChanges
]

{ #category : 'accessing' }
SpkUnsavedChangesAnnouncement >> hasUnsavedChanges: anObject [
	hasUnsavedChanges := anObject
]
