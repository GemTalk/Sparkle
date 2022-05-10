Class {
	#name : 'SpkInspectorView',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'name'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'refreshing' }
SpkInspectorView >> labelString [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkInspectorView >> name [

	^ name
]

{ #category : 'accessing' }
SpkInspectorView >> name: anObject [

	name := anObject
]
