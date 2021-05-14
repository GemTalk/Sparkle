"
General services needed by tool objects.

Every tool has a reference to the tool for the taskspace that it is part of.
"
Class {
	#name : 'SpkTool',
	#superclass : 'SpkObject',
	#instVars : [
		'announcer',
		'taskspaceTool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'comparing' }
SpkTool >> = anObject [
	"Announcers are expected to be different for each instance, 
	so do not influence equality."

	^ self species == anObject species
		and: [ taskspaceTool == anObject taskspaceTool ]
]

{ #category : 'accessing' }
SpkTool >> announce: anAnnouncement [

	self announcer announce: anAnnouncement
]

{ #category : 'accessing' }
SpkTool >> announcer [

	^ announcer 
]

{ #category : 'comparing' }
SpkTool >> hash [
	^ taskspaceTool identityHash
]

{ #category : 'initialization' }
SpkTool >> initialize [

	super initialize.
	announcer := Announcer new
]

{ #category : 'accessing' }
SpkTool >> taskspaceTool [

	^ taskspaceTool
]

{ #category : 'accessing' }
SpkTool >> taskspaceTool: anObject [

	taskspaceTool := anObject
]

{ #category : 'accessing' }
SpkTool >> unsubscribe: anObject [

	self announcer unsubscribe: anObject
]

{ #category : 'accessing' }
SpkTool >> when: anAnnouncementClass send: aSelector to: anObject [
	(self announcer when: anAnnouncementClass send: aSelector to: anObject)
		makeWeak
]
