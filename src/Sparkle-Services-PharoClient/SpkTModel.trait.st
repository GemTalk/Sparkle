"
A trait for Sparkle models that cannot inherit from Model, especially RSR services.
Allows classes to have subscribers and send announcements to them.

Requirements for use:
Define an instance variable _announcer, and create accessors for it.
"
Trait {
	#name : 'SpkTModel',
	#instVars : [
		'announcer'
	],
	#category : 'Sparkle-Services-PharoClient'
}

{ #category : 'accessing' }
SpkTModel >> announce: anAnnouncement [
	self announcer announce: anAnnouncement
]

{ #category : 'accessing' }
SpkTModel >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'accessing' }
SpkTModel >> unsubscribe: anObject [
	self announcer unsubscribe: anObject
]

{ #category : 'accessing' }
SpkTModel >> when: anAnnouncementClass send: aSelector to: anObject [
	self announcer when: anAnnouncementClass send: aSelector to: anObject
]
