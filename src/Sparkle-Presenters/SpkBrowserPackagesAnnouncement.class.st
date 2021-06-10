Class {
	#name : 'SpkBrowserPackagesAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'packages'
	],
	#category : 'Sparkle-Presenters-Announcements'
}

{ #category : 'accessing' }
SpkBrowserPackagesAnnouncement >> packages [

	^ packages
]

{ #category : 'accessing' }
SpkBrowserPackagesAnnouncement >> packages: anObject [

	packages := anObject
]
