Class {
	#name : 'SpkConnectionProfileAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'profiles'
	],
	#category : 'Sparkle-Presenters-Announcements'
}

{ #category : 'accessing' }
SpkConnectionProfileAnnouncement >> profiles [

	^ profiles
]

{ #category : 'accessing' }
SpkConnectionProfileAnnouncement >> profiles: anObject [

	profiles := anObject
]
