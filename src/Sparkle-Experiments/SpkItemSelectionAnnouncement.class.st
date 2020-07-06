Class {
	#name : 'SpkItemSelectionAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'item'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'instance creation' }
SpkItemSelectionAnnouncement class >> forItem: anObject [
	^ self new
		item: anObject;
		yourself
]

{ #category : 'accessing' }
SpkItemSelectionAnnouncement >> item [
	^ item
]

{ #category : 'accessing' }
SpkItemSelectionAnnouncement >> item: anObject [
	item := anObject
]
