"
Could be a ""debugger never opened announcement, too"" 
"
Class {
	#name : 'SpkDebuggerResultReadyAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'result',
		'cursorPosition'
	],
	#category : 'Sparkle-Presenters-Announcements'
}

{ #category : 'accessing' }
SpkDebuggerResultReadyAnnouncement >> cursorPosition [

	^ cursorPosition
]

{ #category : 'accessing' }
SpkDebuggerResultReadyAnnouncement >> cursorPosition: anObject [

	cursorPosition := anObject
]

{ #category : 'accessing' }
SpkDebuggerResultReadyAnnouncement >> result [

	^ result
]

{ #category : 'accessing' }
SpkDebuggerResultReadyAnnouncement >> result: anObject [

	result := anObject
]
