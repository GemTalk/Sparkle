Class {
	#name : 'SpkTraditionalInspectorPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'inspectorService'
	],
	#classVars : [
		'DebuggerAnnouncer'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initialize [

	super initialize.
	inspectorService := SpkScaffoldingTraditionalInspectorServiceClient new 
		                    registerWith:
		                    SpkConnectionProfile defaultConnection
]

{ #category : 'accessing' }
SpkTraditionalInspectorPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]
