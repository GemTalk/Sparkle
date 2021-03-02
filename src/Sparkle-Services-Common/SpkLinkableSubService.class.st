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
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkLinkableSubService >> parentService: anObject [

	parentService := anObject
]
