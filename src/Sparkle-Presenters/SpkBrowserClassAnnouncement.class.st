Class {
	#name : 'SpkBrowserClassAnnouncement',
	#superclass : 'SpkBrowserAnnouncement',
	#instVars : [
		'methods'
	],
	#category : 'Sparkle-Presenters-Announcements'
}

{ #category : 'accessing' }
SpkBrowserClassAnnouncement >> className [

	^name
]

{ #category : 'testing' }
SpkBrowserClassAnnouncement >> isRelevantToClass: className [ 

	^self className = className 
]

{ #category : 'accessing' }
SpkBrowserClassAnnouncement >> methods [

	^ methods
]

{ #category : 'accessing' }
SpkBrowserClassAnnouncement >> methods: anObject [

	methods := anObject
]
