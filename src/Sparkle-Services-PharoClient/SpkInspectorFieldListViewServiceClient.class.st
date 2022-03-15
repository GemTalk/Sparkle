Class {
	#name : 'SpkInspectorFieldListViewServiceClient',
	#superclass : 'SpkInspectorFieldListViewService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'api' }
SpkInspectorFieldListViewServiceClient >> listItems [

	^ fields
]
