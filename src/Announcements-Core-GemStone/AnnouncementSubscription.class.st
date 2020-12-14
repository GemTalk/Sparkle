"
The subscription is a single entry in a SubscriptionRegistry.
Several subscriptions by the same object is possible.

I know how to make myself weak or strong, only use this capability if it can't be determined at subscribe time though, as it uses become: (for thread-safety), which is quite slow.
"
Class {
	#name : 'AnnouncementSubscription',
	#superclass : 'Object',
	#instVars : [
		'announcer',
		'announcementClass',
		'subscriber',
		'action'
	],
	#category : 'Announcements-Core-GemStone'
}

{ #category : 'accessing' }
AnnouncementSubscription >> action [

	^ action
]

{ #category : 'accessing' }
AnnouncementSubscription >> action: anObject [

	action := anObject
]

{ #category : 'accessing' }
AnnouncementSubscription >> announcementClass [

	^ announcementClass
]

{ #category : 'accessing' }
AnnouncementSubscription >> announcementClass: anObject [

	announcementClass := anObject
]

{ #category : 'accessing' }
AnnouncementSubscription >> announcer [

	^ announcer
]

{ #category : 'accessing' }
AnnouncementSubscription >> announcer: anAnnouncer [
	announcer := anAnnouncer
]

{ #category : 'announcing' }
AnnouncementSubscription >> deliver: anAnnouncement [
	" deliver an announcement to receiver. In case of failure, it will be handled in separate process"

	^ (self handlesAnnouncement: anAnnouncement ) ifTrue: [
		[action cull: anAnnouncement cull: announcer] 
"Pharo has:
			on: UnhandledError fork: [:ex | ex pass ]]
GemStone has:
"			on: Error
			do: announcer deliveryErrorHandler]
]

{ #category : 'testing' }
AnnouncementSubscription >> handlesAnnouncement: anAnnouncement [

	^ announcementClass handlesAnnouncement: anAnnouncement
]

{ #category : 'accessing' }
AnnouncementSubscription >> subscriber [
	^ subscriber
]

{ #category : 'accessing' }
AnnouncementSubscription >> subscriber: aSubscriber [
	subscriber := aSubscriber
]

{ #category : 'accessing' }
AnnouncementSubscription >> valuable: aValuable [
	"Used when subscriber should be extracted from valuable object"
	self action:  aValuable.
	self subscriber: aValuable receiver.
]
