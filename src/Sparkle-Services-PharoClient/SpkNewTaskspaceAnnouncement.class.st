"
Used to announce a taskspace layout service to a taskspace, so it can open window(s) corresponding to the layout.

Intended to be used for initial opening the windows of a default taskspace or a saved taskspace.

Internal Representation and Key Implementation Points.

    Instance Variables
	taskspaceLayoutService:		<SpkTaskspaceLayoutServiceClient>


    Implementation Points
"
Class {
	#name : 'SpkNewTaskspaceAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'taskspaceService'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'accessing' }
SpkNewTaskspaceAnnouncement >> taskspaceService [

	^ taskspaceService
]

{ #category : 'accessing' }
SpkNewTaskspaceAnnouncement >> taskspaceService: anObject [

	taskspaceService := anObject
]
