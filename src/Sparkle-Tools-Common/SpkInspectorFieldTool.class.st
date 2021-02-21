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
	#superclass : 'SpkInspectionTool',
	#instVars : [
		'name',
		'index',
		'oop'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'private' }
SpkInspectorFieldTool >> classOfInspectedObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ SpkReflection classOf: inspectedObject
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
SpkInspectorFieldTool >> name [

	^ name
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> oop [

	^ oop
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> oop: anObject [

	oop := anObject
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> refresh [

	self
		refreshName;
		refreshOop
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> refreshName [

	| class names |
	class := self classOfInspectedObject.
	names := class allInstVarNames.
	name := index > names size
		        ifFalse: [ names at: index ]
		        ifTrue: [ (index - names size) printString ]
]

{ #category : 'accessing' }
SpkInspectorFieldTool >> refreshOop [

	| class names value |
	class := self classOfInspectedObject.
	names := class allInstVarNames.
	value := index > names size
		         ifFalse: [ 
		         SpkReflection
			         fetchNamedInstvarAt: index
			         from: inspectedObject ]
		         ifTrue: [ 
			         SpkReflection
				         fetchIndexedInstvarAt: index - names size
				         from: inspectedObject ].
	oop := SpkReflection identifierOf: value
]
