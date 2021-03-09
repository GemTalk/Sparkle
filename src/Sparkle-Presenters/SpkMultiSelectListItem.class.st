"
The presentation-layer model for one field in the field list of an inspector pane.

 
**Internal Representation and Key Implementation Points.**

**    Instance Variables**
*	list: 		<SpkMultiSelectList> 	The list I'm an element in
*	index:		<Integer> Which item in the list I am
*	model:		<SpkInspectorFieldServiceClient> The service for this field.


    Implementation Points

When the field is clicked on, a linked inspector pane is opened in the next column. That pane stays linked until either
* The linked pane is closed
* The linked pane is unlinked by being dragged to a different position or window.

Whether or not linkedPane is nil controls how the link column of the table is displayed.
"
Class {
	#name : 'SpkMultiSelectListItem',
	#superclass : 'Object',
	#traits : 'SpkTLinkedPane',
	#classTraits : 'SpkTLinkedPane classTrait',
	#instVars : [
		'model',
		'list',
		'index'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'instance creation' }
SpkMultiSelectListItem class >> for: aModel [
self halt.
	^ self new
		  model: aModel;
		  yourself 
]

{ #category : 'events' }
SpkMultiSelectListItem >> closingLinkedPane: aPane [

	self linkedPane == aPane ifFalse: [ 
		self error: 'Only my linked pane should notify me when closing.' ].
	self clearLinkedPane.
	list deselectItem: self
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> column [

	^ list column
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> columnAt: anInteger [

	^ model columnAt: anInteger
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> coordinateRelativeTo: parentCoordinate [

	"Linked inspectors for fields get a 0 element in their coordinate. 
	Ones for evaluators get the evaluator's index."

	^ parentCoordinate , 0 , index
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> description [
	^ model description
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> index [
	^ index
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> index: anObject [
	index := anObject
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> list: anObject [

	list := anObject
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> model [
	^ model
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> model: anObject [
	model := anObject
]

{ #category : 'accessing' }
SpkMultiSelectListItem >> name [
	^ model name
]
