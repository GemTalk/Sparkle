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
	#category : 'Sparkle-Services-PharoClient-Support'
}

{ #category : 'announcing' }
SpkTModel >> announce: anAnnouncement [
	self announcer announce: anAnnouncement
]

{ #category : 'announcing' }
SpkTModel >> announceNewService: newService forRequest: requestId [

	| announcement |
	announcement := SpkNewPaneService new
		                service: newService;
		                requestId: requestId;
		                yourself.
	self announce: announcement
]

{ #category : 'as yet unclassified' }
SpkTModel >> announceUpdate [

	"Announce a generic update announcement"

	self announce: SpkUpdateAnnouncement new
]

{ #category : 'accessing' }
SpkTModel >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'work in progress' }
SpkTModel >> notYetImplemented: aString [

	SpkPresenter notYetImplemented: aString
]

{ #category : 'accessing' }
SpkTModel >> unsubscribe: anObject [

	self announcer unsubscribe: anObject
]

{ #category : 'announcing' }
SpkTModel >> when: anAnnouncementClass send: aSelector to: anObject [

	self announcer when: anAnnouncementClass send: aSelector to: anObject
]
