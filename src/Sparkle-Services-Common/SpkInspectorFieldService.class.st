"
Describes one field (named instvar or indexed instvar or some kind of virtual field) of an object being inspected.

Collaborates with SpkInspectorService.

Internal Representation and Key Implementation Points.

    Instance Variables
	description:		<String>
	name:		<String>


    Implementation Points

Even when inspecting indexed instvars, name is always a string. Strings like '1', '2', and so on.
"
Class {
	#name : 'SpkInspectorFieldService',
	#superclass : 'RsrService',
	#instVars : [
		'name',
		'description'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'as yet unclassified' }
SpkInspectorFieldService class >> name: nameString description: descriptionString [

	^ self new
		  name: nameString;
		  description: descriptionString;
		  yourself
]

{ #category : 'accessing' }
SpkInspectorFieldService class >> templateClassName [

	^ #SpkInspectorFieldService
]

{ #category : 'accessing' }
SpkInspectorFieldService >> description [
	^ description
]

{ #category : 'accessing' }
SpkInspectorFieldService >> description: anObject [
	description := anObject
]

{ #category : 'accessing' }
SpkInspectorFieldService >> name [
	^ name
]

{ #category : 'accessing' }
SpkInspectorFieldService >> name: anObject [
	name := anObject
]
