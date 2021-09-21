Class {
	#name : 'SpkNewExplorerLayoutToolAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkNewExplorerLayoutToolAnnouncement class >> tool: anExplorerLayoutTool [

	^self new
		tool: anExplorerLayoutTool;
		yourself
]

{ #category : 'accessing' }
SpkNewExplorerLayoutToolAnnouncement >> tool [

	^tool
]

{ #category : 'accessing' }
SpkNewExplorerLayoutToolAnnouncement >> tool: anExplorerLayoutTool [

	tool := anExplorerLayoutTool
]
