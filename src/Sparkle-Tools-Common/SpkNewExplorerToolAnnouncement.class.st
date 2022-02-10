"
Used to announce from server to client when a new explorer window needs to be opened
that is *not* the direct result of a client request.
Example: If a forked process signals an unhandled exception, it will open a new independent
debugger window using this announcement.
"
Class {
	#name : 'SpkNewExplorerToolAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkNewExplorerToolAnnouncement class >> tool: anExplorerLayoutTool [

	^self new
		tool: anExplorerLayoutTool;
		yourself
]

{ #category : 'accessing' }
SpkNewExplorerToolAnnouncement >> tool [

	^tool
]

{ #category : 'accessing' }
SpkNewExplorerToolAnnouncement >> tool: anExplorerLayoutTool [

	tool := anExplorerLayoutTool
]
