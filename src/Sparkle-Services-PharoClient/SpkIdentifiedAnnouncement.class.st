"
Abstract announcement class. Subclasses are used by the service layer to announce things to the presentation layer. 
All such announcements can carry a request ID, so that the presentation layer can connect the announcement to the request, if it feels the need to.


Internal Representation and Key Implementation Points.

    Instance Variables
	requestId:		<Object> Some object chosen by the requester of an action, to be sent back untouched in the announcement.


    Implementation Points

The request ID can be _any_ kind of object. The service layer is prohibited from sending _any_ messages to this object. The object is just put in the announcement that represents the outcome of the request.

"
Class {
	#name : 'SpkIdentifiedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'requestId'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'accessing' }
SpkIdentifiedAnnouncement >> requestId [
	^ requestId
]

{ #category : 'accessing' }
SpkIdentifiedAnnouncement >> requestId: anObject [
	requestId := anObject
]
