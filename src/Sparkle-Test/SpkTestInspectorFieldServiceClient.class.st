Class {
	#name : 'SpkTestInspectorFieldServiceClient',
	#superclass : 'SpkInspectorFieldServiceClient',
	#traits : 'SpkTLocalPromise',
	#classTraits : 'SpkTLocalPromise classTrait',
	#category : 'Sparkle-Test-Test Services'
}

{ #category : 'inspecting' }
SpkTestInspectorFieldServiceClient >> createInspectorService [

	"Ask the server for an inspector for the object referred to by this field. 
	Answer a promise for the result."

	^ self promiseFor: [ 
		  inspectorService := SpkTestInspectorServiceClient perform:
			                      ('spk' , name) asSymbol ]
]
