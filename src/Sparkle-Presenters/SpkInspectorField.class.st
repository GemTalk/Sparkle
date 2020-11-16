Class {
	#name : 'SpkInspectorField',
	#superclass : 'Object',
	#instVars : [
		'model',
		'isOpen'
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

{ #category : 'initialization' }
SpkInspectorField >> initialize [

	super initialize.
	isOpen := false
]

{ #category : 'accessing' }
SpkInspectorField >> isOpen [
	^ isOpen
]

{ #category : 'accessing' }
SpkInspectorField >> isOpen: anObject [
	isOpen := anObject
]

{ #category : 'accessing' }
SpkInspectorField >> model: anObject [
	model := anObject
]

{ #category : 'accessing' }
SpkInspectorField >> name [
	^ model name
]
