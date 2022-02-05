"
I'm announced to a taskspace when an explorer window needs to be opened for the service I contain.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	explorerLayoutService:		<SpkExplorerLayoutServiceClient>


    Implementation Points
"
Class {
	#name : 'SpkExplorerToOpenAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'service'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'instance creation' }
SpkExplorerToOpenAnnouncement class >> service: anExplorerLayoutService [

	^self new
		service: anExplorerLayoutService;
		yourself
]

{ #category : 'accessing' }
SpkExplorerToOpenAnnouncement >> service [

	^ service
]

{ #category : 'accessing' }
SpkExplorerToOpenAnnouncement >> service: anObject [

	service := anObject
]
