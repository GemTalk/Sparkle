Class {
	#name : 'SpkInspectorFieldServiceClient',
	#superclass : 'SpkInspectorFieldService',
	#traits : 'SpkTPromise + SpkTModel',
	#classTraits : 'SpkTPromise classTrait + SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'inspecting' }
SpkInspectorFieldServiceClient >> inspect [

	"Ask the server for an inspector for the object referred to by this field. 
	Answer a promise for the result."

	^ remoteSelf inspect
]
