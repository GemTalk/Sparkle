"
I'm announced when an explorer window has been opened as the result of a service being received from the server.

This is currently used only by UI tests, to tell when a window has completed opening.

Internal Representation and Key Implementation Points.

    Instance Variables
	explorer:		<SpkExplorerServiceClient>


    Implementation Points
"
Class {
	#name : 'SpkExplorerOpenedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'explorer'
	],
	#category : 'Sparkle-Presenters-Announcements'
}

{ #category : 'accessing' }
SpkExplorerOpenedAnnouncement >> explorer [

	^ explorer
]

{ #category : 'accessing' }
SpkExplorerOpenedAnnouncement >> explorer: anObject [

	explorer := anObject
]
