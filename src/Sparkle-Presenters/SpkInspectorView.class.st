Class {
	#name : 'SpkInspectorView',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'name'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkInspectorView >> name [

	^ name
]

{ #category : 'accessing' }
SpkInspectorView >> name: anObject [

	name := anObject
]

{ #category : 'instance creation' }
SpkInspectorView >> newLayout [
	
	^ SpkBoxLayout newVertical
]
