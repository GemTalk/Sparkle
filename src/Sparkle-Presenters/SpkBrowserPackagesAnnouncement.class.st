Class {
	#name : 'SpkBrowserPackagesAnnouncement',
	#superclass : 'SpkBrowserAnnouncement',
	#instVars : [
		'packages'
	],
	#category : 'Sparkle-Presenters-Announcements'
}

{ #category : 'testing' }
SpkBrowserPackagesAnnouncement >> isRelevantToProject: projectName [

	^self projectName = projectName 
]

{ #category : 'accessing' }
SpkBrowserPackagesAnnouncement >> packages [

	^ packages
]

{ #category : 'accessing' }
SpkBrowserPackagesAnnouncement >> packages: anObject [

	packages := anObject
]

{ #category : 'accessing' }
SpkBrowserPackagesAnnouncement >> projectName [

	^ name
]
