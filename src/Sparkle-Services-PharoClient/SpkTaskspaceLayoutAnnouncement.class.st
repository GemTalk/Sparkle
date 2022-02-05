"
Used to announce a taskspace layout service to a taskspace, so it can open window(s) corresponding to the layout.

Intended to be used for initial opening the windows of a default taskspace or a saved taskspace.

Internal Representation and Key Implementation Points.

    Instance Variables
	taskspaceLayoutService:		<SpkTaskspaceLayoutServiceClient>


    Implementation Points
"
Class {
	#name : 'SpkTaskspaceLayoutAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'taskspaceLayoutService'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'accessing' }
SpkTaskspaceLayoutAnnouncement >> taskspaceLayoutService [

	^ taskspaceLayoutService
]

{ #category : 'accessing' }
SpkTaskspaceLayoutAnnouncement >> taskspaceLayoutService: anObject [

	taskspaceLayoutService := anObject
]
