"
A service for inspecting one GemStone object.

Instance Variables
*	oop:		<Integer> The GemStone object ID of the object being inspected (in GemStone, an oop is a unique ID, unlike an identity hash)
*	classMambershipDescription	<String> For an instance of Date, 'a Date'. For the class Date, 'Date'. For the metaclass, 'Date class'.
*	selfDescription		<String> How the object describes itself; the result of a #printOn: of the object being inspected.
*  fields				<OrderedCollection of SpkInspectorFielsService> Names and description of each of the object's fields.
*  evaluators: 		<OrderedCollection of SpkEvaluatorService> Any evaluators that are open for this inspector


"
Class {
	#name : 'SpkInspectorService',
	#superclass : 'RsrService',
	#instVars : [
		'oop',
		'classMembershipDescription',
		'selfDescription',
		'views',
		'defaultView',
		'evaluators'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkInspectorService class >> templateClassName [

	^ #SpkInspectorService
]

{ #category : 'accessing' }
SpkInspectorService >> classMembershipDescription [
	^ classMembershipDescription
]

{ #category : 'accessing' }
SpkInspectorService >> classMembershipDescription: anObject [
	classMembershipDescription := anObject
]

{ #category : 'accessing' }
SpkInspectorService >> evaluators [

	^ evaluators
]

{ #category : 'initialization' }
SpkInspectorService >> initialize [

	super initialize.
	views := OrderedCollection new.
	evaluators := OrderedCollection new
]

{ #category : 'accessing' }
SpkInspectorService >> oop [
	^ oop
]

{ #category : 'accessing' }
SpkInspectorService >> oop: anObject [
	oop := anObject
]

{ #category : 'accessing' }
SpkInspectorService >> selfDescription [
	^ selfDescription
]

{ #category : 'accessing' }
SpkInspectorService >> selfDescription: anObject [
	selfDescription := anObject
]
