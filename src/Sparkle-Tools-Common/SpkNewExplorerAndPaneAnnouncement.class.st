"
Announces that an explorer window should be opened for the explorerService, containing a single column, containing a single pane for the paneService.
Used both for tool -> service announcing, and service -> presentation announcing. 

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
		'explorer',
		'pane'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'as yet unclassified' }
SpkNewExplorerAndPaneAnnouncement class >> explorer: x pane: p [

	^ self new
		  explorer: x;
		  pane: p;
		  yourself
]

{ #category : 'accessing' }
SpkNewExplorerAndPaneAnnouncement >> explorer [
	^explorer
]

{ #category : 'accessing' }
SpkNewExplorerAndPaneAnnouncement >> explorer: object [
	explorer := object
]

{ #category : 'accessing' }
SpkNewExplorerAndPaneAnnouncement >> pane [
	^pane
]

{ #category : 'accessing' }
SpkNewExplorerAndPaneAnnouncement >> pane: object [
	pane := object
]
