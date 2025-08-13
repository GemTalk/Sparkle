Class {
	#name : 'SpkConnectionProfileAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'profiles'
	],
	#category : 'Sparkle-Presenters-Announcements',
	#package : 'Sparkle-Presenters',
	#tag : 'Announcements'
}

{ #category : 'accessing' }
SpkConnectionProfileAnnouncement >> profiles [

	^ profiles
]

{ #category : 'accessing' }
SpkConnectionProfileAnnouncement >> profiles: anObject [

	profiles := anObject
]
