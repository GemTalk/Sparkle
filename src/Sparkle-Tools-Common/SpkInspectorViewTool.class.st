Class {
	#name : 'SpkInspectorViewTool',
	#superclass : 'SpkInspectionTool',
	#instVars : [
		'inspectedObject'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'testing' }
SpkInspectorViewTool class >> canView: anObject [
	"Answer true if my instances can provide a meaningful view of the given object."

	self subclassResponsibility
]

{ #category : 'private' }
SpkInspectorViewTool class >> concreteSubclasses [
	"GemStone does not yet have a performant way for a class to know
	its subclasses, so we must list them here."

	^ {SpkInspectorRawViewTool.
	SpkInspectorSetViewTool}
]

{ #category : 'instance creation' }
SpkInspectorViewTool class >> on: anObject [

	^ self new
		  inspectedObject: anObject;
		  yourself
]

{ #category : 'instance creation' }
SpkInspectorViewTool class >> viewsOn: anObject [
	"Answer the view tools appropriate for the given object,
	ordered by each's idea of its priority relative to that object."

	| viewClasses views |
	viewClasses := self concreteSubclasses
		select: [ :each | each canView: anObject ].
	views := viewClasses collect: [ :viewClass | viewClass on: anObject ].
	^ SortedCollection
		withAll: views
		sortBlock: [ :a :b | a priority > b priority ]
]

{ #category : 'accessing' }
SpkInspectorViewTool >> inspectedObject: anObject [

	inspectedObject := anObject
]

{ #category : 'accessing' }
SpkInspectorViewTool >> priority [
	"Answer my relative usefulness, as a Float, for viewing my inspectedObject."

	self subclassResponsibility
]

{ #category : 'refreshing' }
SpkInspectorViewTool >> refresh [

	"Update myself from my inspected object."

	self subclassResponsibility
]
