"
My subclasses announce selection or deselection of an item. 
Note that index is the index within the selected items, not the index within all available items.
"
Class {
	#name : 'SpkItemSelectionAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'item',
		'index'
	],
	#category : 'Sparkle-Presenters-Announcements'
}

{ #category : 'instance creation' }
SpkItemSelectionAnnouncement class >> forItem: anObject index: anInteger [
	^ self new
		  item: anObject;
		  index: anInteger;
		  yourself
]

{ #category : 'accessing' }
SpkItemSelectionAnnouncement >> index [
	^ index
]

{ #category : 'accessing' }
SpkItemSelectionAnnouncement >> index: anObject [
	index := anObject
]

{ #category : 'accessing' }
SpkItemSelectionAnnouncement >> item [
	^ item
]

{ #category : 'accessing' }
SpkItemSelectionAnnouncement >> item: anObject [
	item := anObject
]
