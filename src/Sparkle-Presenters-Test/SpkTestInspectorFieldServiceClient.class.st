Class {
	#name : 'SpkTestInspectorFieldServiceClient',
	#superclass : 'SpkInspectorFieldServiceClient',
	#traits : 'SpkTLocalPromise',
	#classTraits : 'SpkTLocalPromise classTrait',
	#category : 'Sparkle-Presenters-Test-Support'
}

{ #category : 'inspecting' }
SpkTestInspectorFieldServiceClient >> createInspectorService [

	"Ask the server for an inspector for the object referred to by this field. 
	Answer a promise for the result."

	^ self promiseFor: [ 
		  linkedInspectorService := SpkTestInspectorServiceClient perform:
			                      ('spk' , name) asSymbol ]
]
