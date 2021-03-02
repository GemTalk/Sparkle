"
Describes one field (named instvar or indexed instvar or some kind of virtual field) of an object being inspected.

Collaborates with SpkInspectorService.

**Internal Representation and Key Implementation Points.**

    Instance Variables
*	description:		<String>
*	name:		<String>
* 	parentService:	<SpkInspectorService>	The inspector service for which I am a field.
*	linkedInspectorService: <nil or SpkInspectorService>	 Inspector for the object referenced by this field, if one has been created.


    Implementation Points

Even when inspecting indexed instvars, name is always a string. Strings like '1', '2', and so on.
"
Class {
	#name : 'SpkInspectorFieldService',
	#superclass : 'SpkLinkableSubService',
	#instVars : [
		'columns'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'instance creation' }
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
SpkInspectorFieldService >> columnAt: anInteger [

	^ columns at: anInteger
]

{ #category : 'accessing' }
SpkInspectorFieldService >> columns [

	^ columns
]

{ #category : 'accessing' }
SpkInspectorFieldService >> columns: anObject [

	columns := anObject
]

{ #category : 'initialization' }
SpkInspectorFieldService >> initialize [

	super initialize.
	columns := #(  )
]
