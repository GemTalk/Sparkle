"
I'm announced when a requested pane service arrives from the server.
 
Internal Representation and Key Implementation Points.

    **Instance Variables**
-	service:	<RSR client service>		The new service itself.


    **Implementation Points**

I will be announced from an RSR internal thread unrelated to any existing thread. A presenter subscribing to me must defer the message to then be handled in the UI thread.
"
Class {
	#name : 'SpkNewPaneService',
	#superclass : 'SpkIdentifiedAnnouncement',
	#instVars : [
		'service'
	],
	#category : 'Sparkle-Services-PharoClient-Announcements'
}

{ #category : 'accessing' }
SpkNewPaneService >> service [
	^ service
]

{ #category : 'accessing' }
SpkNewPaneService >> service: anObject [
	service := anObject
]
