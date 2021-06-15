Class {
	#name : 'SpkBrowserClassesAnnouncement',
	#superclass : 'SpkBrowserAnnouncement',
	#instVars : [
		'classes'
	],
	#category : 'Sparkle-Presenters-Announcements'
}

{ #category : 'accessing' }
SpkBrowserClassesAnnouncement >> classes [

	^ classes
]

{ #category : 'accessing' }
SpkBrowserClassesAnnouncement >> classes: anObject [

	classes := anObject
]

{ #category : 'testing' }
SpkBrowserClassesAnnouncement >> isRelevantToPackage: packageName [ 

	^self packageName = packageName 
]

{ #category : 'accessing' }
SpkBrowserClassesAnnouncement >> packageName [

	^ name
]
