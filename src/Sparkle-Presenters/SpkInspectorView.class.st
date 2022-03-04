Class {
	#name : 'SpkInspectorView',
	#superclass : 'SpkPresenterWithModel',
	#traits : 'SpkTInspectableFieldList',
	#classTraits : 'SpkTInspectableFieldList classTrait',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'instance creation' }
SpkInspectorView >> newLayout [
	
	^ SpkBoxLayout newVertical
]
