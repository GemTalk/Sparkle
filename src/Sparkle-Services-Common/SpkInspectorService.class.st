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

{ #category : 'accessing' }
SpkInspectorService >> description [
	^ description
]

{ #category : 'accessing' }
SpkInspectorService >> description: anObject [
	description := anObject
]

{ #category : 'accessing' }
SpkInspectorService >> fields [
	^ fields
]

{ #category : 'accessing' }
SpkInspectorService >> fields: anObject [
	fields := anObject
]

{ #category : 'accessing' }
SpkInspectorService >> oop [
	^ oop
]

{ #category : 'accessing' }
SpkInspectorService >> oop: anObject [
	oop := anObject
]
