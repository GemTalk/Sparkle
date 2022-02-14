"
Announces that an explorer window should be opened for the explorerService, containing a single column, containing a single pane for the paneService.
  
Internal Representation and Key Implementation Points.

    Instance Variables
	explorerService:		<SpkExplorerServiceClient>
	paneService:		<RsrService> Service for a pane (inspector, debugger, debugger frame, process list, ...)


    Implementation Points
"
Class {
	#name : 'SpkNewExplorerAndPaneAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'explorerService',
		'paneService'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'as yet unclassified' }
SpkNewExplorerAndPaneAnnouncement class >> explorerService: xService paneService: pService [

	^ self new
		  explorerService: xService;
		  paneService: pService;
		  yourself
]

{ #category : 'accessing' }
SpkNewExplorerAndPaneAnnouncement >> explorerService [

	^ explorerService
]

{ #category : 'accessing' }
SpkNewExplorerAndPaneAnnouncement >> explorerService: anObject [

	explorerService := anObject
]

{ #category : 'accessing' }
SpkNewExplorerAndPaneAnnouncement >> paneService [

	^ paneService
]

{ #category : 'accessing' }
SpkNewExplorerAndPaneAnnouncement >> paneService: anObject [

	paneService := anObject
]
