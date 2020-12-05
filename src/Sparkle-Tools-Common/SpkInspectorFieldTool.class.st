"
Abstract. 
I am a tool providing information about and the ability to manipulate one ""field"" of an object being inspected.
A field is some bit of information about the object. In the raw view this means an instance variable, named or indexed. In other views it might mean some other piece of information, such as an element of a Set. My subclasses handle the details.
 
Internal Representation and Key Implementation Points.

    **Instance Variables**
-	index:					<Integer> One-based index into named instvars, indexed instvars, or other elements depending on subclass.
-	inspectorTool:		<SpkInspectorTool> The inspector tool that I serve, and which refers to the object being inspected.
-	name:		<String>	The name of the field. Indexed instvars are named like the strings '1', '2', etc.
-	selfDescription:		<String>	The result of sending #printOn: to the value of the field. Empty string if #printOn: is not understood.
-	value:		<Object>	The actual object referred to by this field in the object under inspection.


    Implementation Points
"
Class {
	#name : 'SpkInspectorFieldTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'inspectorTool',
		'value',
		'name',
		'index',
		'selfDescription'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkInspectorFieldTool >> explorerTool [

	^ explorerTool
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> explorerTool: anObject [

	explorerTool := anObject
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> index [

	^ index
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> index: anObject [

	index := anObject
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> inspectorTool [

	^ inspectorTool
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> inspectorTool: anObject [

	inspectorTool := anObject
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> name [

	^ name
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> selfDescription [

	^ selfDescription
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> selfDescription: anObject [

	selfDescription := anObject
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> value [

	^ value
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> value: anObject [

	value := anObject
]
