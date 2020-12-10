"
General services needed by tool objects.
"
Class {
	#name : 'SpkTool',
	#superclass : 'Object',
	#instVars : [
		'announcer'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkTool >> announce: anAnnouncement [

	self announcer announce: anAnnouncement
]

{ #category : 'accessing' }
SpkTool >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'accessing' }
SpkTool >> unsubscribe: anObject [

	self announcer unsubscribe: anObject
]

{ #category : 'accessing' }
SpkTool >> when: anAnnouncementClass send: aSelector to: anObject [

	self announcer when: anAnnouncementClass send: aSelector to: anObject
]
