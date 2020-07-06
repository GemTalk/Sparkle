Trait {
	#name : 'SpkTModel',
	#category : 'Sparkle-Experiments'
}

{ #category : 'accessing' }
SpkTModel >> announce: anAnnouncement [
	self announcer announce: anAnnouncement
]

{ #category : 'accessing' }
SpkTModel >> announcer [
	^ self _announcer ifNil: [ self _announcer: Announcer new ]
]

{ #category : 'accessing' }
SpkTModel >> unsubscribe: anObject [
	self announcer unsubscribe: anObject
]

{ #category : 'accessing' }
SpkTModel >> when: anAnnouncementClass send: aSelector to: anObject [
	self announcer when: anAnnouncementClass send: aSelector to: anObject
]
