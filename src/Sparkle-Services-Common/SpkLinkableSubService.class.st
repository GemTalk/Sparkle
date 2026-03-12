"
Abstract. My subclasses represent parts of a larger service, and can have a service linked to them
 
Internal Representation and Key Implementation Points.

    Instance Variables
*	linkedService:		<Object>
*	parentService:		<Object>


    Implementation Points
"
Class {
	#name : 'SpkLinkableSubService',
	#superclass : 'RsrService',
	#instVars : [
		'parentService'
	],
	#category : 'Sparkle-Services-Common-Services',
	#package : 'Sparkle-Services-Common',
	#tag : 'Services'
}

{ #category : 'accessing' }
SpkLinkableSubService >> parentService: anObject [

	parentService := anObject
]
