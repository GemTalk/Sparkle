"
I'm announced when a requested InspectorServiceClient arrives from the server.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	index:		<Integer>		The index of the field in the ""parent"" service which this service inspects.
	service:	<SpkInspectorServiceClient>		The new service itself.


    Implementation Points

I will be announced from an RSR internal thread unrelated to any existing thread. A presenter subscribing to me must defer the message to get it back in the UI thread.
"
Class {
	#name : 'SpkInspectorCreated',
	#superclass : 'SpkIdentifiedAnnouncement',
	#instVars : [
		'service'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'accessing' }
SpkInspectorCreated >> service [
	^ service
]

{ #category : 'accessing' }
SpkInspectorCreated >> service: anObject [
	service := anObject
]
