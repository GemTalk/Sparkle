"
Used to announce from server to client when a new explorer window needs to be opened
that is *not* the direct result of a client request.
Example: If a forked process signals an unhandled exception, it will open a new independent
debugger window using this announcement.
"
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
