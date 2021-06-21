Class {
	#name : 'SpkBrowserFindAnnouncement',
	#superclass : 'SpkBrowserAnnouncement',
	#instVars : [
		'selectedItem'
	],
	#category : 'Sparkle-Presenters-Announcements'
}

{ #category : 'accessing' }
SpkBrowserFindAnnouncement >> selectedItem [

	^ selectedItem
]

{ #category : 'accessing' }
SpkBrowserFindAnnouncement >> selectedItem: anObject [

	selectedItem := anObject
]
