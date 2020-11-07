Class {
	#name : 'SpkInspectorField',
	#superclass : 'Object',
	#instVars : [
		'name',
		'description',
		'isOpen'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'accessing' }
SpkInspectorField >> description [
	^ description
]

{ #category : 'accessing' }
SpkInspectorField >> description: anObject [
	description := anObject
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
SpkInspectorField >> name [
	^ name
]

{ #category : 'accessing' }
SpkInspectorField >> name: anObject [
	name := anObject
]
