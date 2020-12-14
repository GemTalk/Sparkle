"
This class is the superclass for events that someone might want to announce, such as a button click or an attribute change. Typically you create subclasses for your own events you want to announce.
"
Class {
	#name : 'Announcement',
	#superclass : 'Object',
	#category : 'Announcements-Core-GemStone'
}

{ #category : 'public' }
Announcement class >> , anAnnouncementClass [
	^ AnnouncementSet with: self with: anAnnouncementClass
]

{ #category : 'public' }
Announcement class >> andSubclasses [
	^ AnnouncementSet withAll: self withAllSubclasses
]

{ #category : 'converting' }
Announcement class >> asAnnouncement [
	^ self new
]

{ #category : 'deprecated' }
Announcement class >> handles: anAnnouncement [
	^ self handlesAnnouncement: anAnnouncement
]

{ #category : 'testing' }
Announcement class >> handlesAnnouncement: anAnnouncement [
	"The receiver acts as a filter to determine whether subscribers who used the receiver as signaling tag (event identifier class or symbol) should receive incoming announcement. In particular, registering to a superclass will receive the announcements from all subclasses."

	^ anAnnouncement class includesBehavior: self
]

{ #category : 'instance creation' }
Announcement class >> new [

	^super new
		initialize;
		yourself.
]

{ #category : 'converting' }
Announcement >> asAnnouncement [
	^ self
]

{ #category : 'initialization' }
Announcement >> prepareForDelivery [
	"This method will be executed once before subscriptions delivery.
	If nobody subscribed on me this method will not be called.
	It allows to put some heavy initialization logic here. It will be executed only 
	if there is interest on me"
]
