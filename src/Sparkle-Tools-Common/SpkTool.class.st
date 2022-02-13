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

{ #category : 'instance creation' }
SpkTool class >> newInTaskspace: aTaskspaceTool [
	^ self new
		taskspaceTool: aTaskspaceTool;
		yourself
]

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

{ #category : 'utility' }
SpkTool >> selfDescriptionOf: anObject [
	"This message is only used by a few tools, and really should be in a trait,
	but no traits in GemStone yet."

	"Answer a string showing how the inspected object describes itself using printOn:.
        Objects that do not understand #printOn: will answer the empty string.
        Limit output size in case of very long or infinitely recursive implementation of #printOn:,
        but set a high limit."

	| stream |
	stream := SpkLimitedWriteStream on: String new.
	stream
		limit: 250000;
		limitBlock: [ ^ stream contents ].
	SpkReflection
		carefullySend: #'printOn:'
		withArguments: {stream}
		to: anObject
		ifUnsuccessful: [  ].
	^ stream contents
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
