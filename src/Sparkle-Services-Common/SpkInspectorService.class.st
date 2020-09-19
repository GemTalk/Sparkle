"
A service for inspecting one GemStone object.

Instance Variables
*	description:		<String> The result of a #printOn: of the object being inspected.
*	fields:		<Dictionary of String -> String Maps field names to descriptions of the field contents
*	oop:		<Integer> The GemStone object ID of the object being inspected (in GemStone, an oop is a unique ID, unlike an identity hash)


"
Class {
	#name : 'SpkInspectorService',
	#superclass : 'RsrService',
	#instVars : [
		'oop',
		'description',
		'fields'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkInspectorService class >> templateClassName [

	^ #SpkInspectorService
]
