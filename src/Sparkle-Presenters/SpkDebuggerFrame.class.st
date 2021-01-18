"
The presentation-layer model for one frame in the frame list of a debugger pane.

 
**Internal Representation and Key Implementation Points.**

**    Instance Variables**
*	list: 		<SpkMultiSelectList> 	The list I'm an element in
*	listIndex:		<Integer> Which item in the list I am
*	model:		<SpkDebuggerFrameServiceClient> The service for this field.


    Implementation Points

When the frame is selected, a linked debugger frame pane is opened in the next column. That pane stays linked until either
* The linked pane is closed
* The linked pane is unlinked by being dragged to a different position or window.

Whether or not linkedPane is nil controls how the link column of the table is displayed.
"
Class {
	#name : 'SpkDebuggerFrame',
	#superclass : 'Object',
	#traits : 'SpkTLinkedPane',
	#classTraits : 'SpkTLinkedPane classTrait',
	#instVars : [
		'model',
		'list',
		'listIndex'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'instance creation' }
SpkDebuggerFrame class >> for: aModel [

	^ self new
		  model: aModel;
		  yourself
]

{ #category : 'accessing' }
SpkDebuggerFrame >> description [

	^ model description
]

{ #category : 'accessing' }
SpkDebuggerFrame >> index: anObject [

	listIndex := anObject
]

{ #category : 'accessing' }
SpkDebuggerFrame >> list: anObject [

	list := anObject
]

{ #category : 'instance creation' }
SpkDebuggerFrame >> model: anObject [
	model := anObject
]
