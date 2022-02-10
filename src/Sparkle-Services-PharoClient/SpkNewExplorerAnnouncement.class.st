"
I'm announced to a taskspace when an explorer window needs to be opened for the service I contain.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	explorerLayoutService:		<SpkExplorerLayoutServiceClient>


    Implementation Points
"
Class {
	#name : 'SpkNewExplorerAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'service'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'instance creation' }
SpkNewExplorerAnnouncement class >> service: anExplorerLayoutService [

	^self new
		service: anExplorerLayoutService;
		yourself
]

{ #category : 'accessing' }
SpkNewExplorerAnnouncement >> service [

	^ service
]

{ #category : 'accessing' }
SpkNewExplorerAnnouncement >> service: anObject [

	service := anObject
]
