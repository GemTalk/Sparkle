Class {
	#name : 'SpkTestInspectorFieldServiceClient',
	#superclass : 'SpkInspectorFieldServiceClient',
	#traits : 'SpkTLocalPromise',
	#classTraits : 'SpkTLocalPromise classTrait',
	#category : 'Sparkle-Test'
}

{ #category : 'inspecting' }
SpkTestInspectorFieldServiceClient >> createInspectorService [

	"Ask the server for an inspector for the object referred to by this field. 
	Answer a promise for the result."

	"^ remoteSelf createInspectorService"

	"No, simulate it rather rigidly"

	^ self promiseFor: [ SpkTestInspectorServiceClient perform: name asSymbol ]
]
