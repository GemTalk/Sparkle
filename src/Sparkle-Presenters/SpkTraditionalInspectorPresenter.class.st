Class {
	#name : 'SpkTraditionalInspectorPresenter',
	#superclass : 'SpkPresenter',
	#classVars : [
		'DebuggerAnnouncer'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initialize [

	super initialize.
	
]

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initializePresenters [

	| toolbar |
	super initializePresenters.
	toolbar := self newToolbar.
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Inspect';
			 icon: (self iconNamed: #smallInspectIt);
			 help: 'Inspect nil for now';
			 action: [ self inspect ];
			 yourself).
	self layout
		add: toolbar
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'actions' }
SpkTraditionalInspectorPresenter >> inspect [

	| inspectorService promise |
	inspectorService := SpkScaffoldingInspectorServiceClient new 
		                    registerWith:
		                    SpkConnectionProfile defaultConnection.
	promise := inspectorService inspect: 20.
	promise when: [ :result | result inspect ] catch: [ :reason | 
		Transcript
			cr;
			show: '=========';
			cr;
			show: 'UNEXPECTED CATCH: ' , reason printString;
			cr;
			show: DateAndTime now printString;
			cr;
			show: '=========';
			yourself ]
]

{ #category : 'accessing' }
SpkTraditionalInspectorPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]
