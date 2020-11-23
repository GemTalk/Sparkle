"
The presentation-layer model for one field in the field list of an inspector pane.

 
**Internal Representation and Key Implementation Points.**

**    Instance Variables**
*	index:		<Integer> Which item in the list I am
*	linkedPane:		<nil or SpkInspectorPane> The inspector pane for this field in the next column, if any.
*	model:		<SpkInspectorFieldServiceClient> The service for this field.


    Implementation Points

When the field is clicked on, a linked inspector pane is opened in the next column. That pane stays linked until either
* The linked pane is closed
* The linked pane is unlinked by being dragged to a different position or window.

Whether or not linkedPane is nil controls how the link column of the table is displayed.
"
Class {
	#name : 'SpkInspectorField',
	#superclass : 'Object',
	#instVars : [
		'model',
		'index',
		'linkedPane'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'instance creation' }
SpkInspectorField class >> for: aModel [

	^ self new
		  model: aModel;
		  yourself
]

{ #category : 'accessing' }
SpkInspectorField >> description [
	^ model description
]

{ #category : 'testing' }
SpkInspectorField >> hasLinkedPane [

	^ linkedPane notNil
]

{ #category : 'accessing' }
SpkInspectorField >> index [
	^ index
]

{ #category : 'accessing' }
SpkInspectorField >> index: anObject [
	index := anObject
]

{ #category : 'accessing' }
SpkInspectorField >> linkedPane [
	^ linkedPane
]

{ #category : 'accessing' }
SpkInspectorField >> linkedPane: anObject [
	linkedPane := anObject
]

{ #category : 'accessing' }
SpkInspectorField >> model [
	^ model
]

{ #category : 'accessing' }
SpkInspectorField >> model: anObject [
	model := anObject
]

{ #category : 'accessing' }
SpkInspectorField >> name [
	^ model name
]
