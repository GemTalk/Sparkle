Class {
	#name : 'SpkInspectorPane',
	#superclass : 'SpkPane',
	#instVars : [
		'body',
		'addEvaluatorButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'as yet unclassified' }
SpkInspectorPane >> fieldDeselected: anAnnouncement [

	self halt.
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> fieldSelected: anAnnouncement [

	self disableAll. "No GUI actions allowed while waiting for the server."
	self halt.
	self reEnableAll
]

{ #category : 'adding' }
SpkInspectorPane >> initializeAddEvaluatorButton [

	"addEvaluatorButton is an instvar so that enablement and disablement can find it."

	addEvaluatorButton := self newIconButton
		                      icon: (self iconNamed: #addEvaluator24);
		                      help: 'Add Evaluator';
		                      action: [ self addEvaluator ];
		                      yourself.
	self layout
		add: addEvaluatorButton
		withConstraints: [ :constraints | 
			constraints
				height: 26;
				width: 26 ]
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeBody [

	body := self instantiate: SpkInspectorPaneBody on: model.
	self layout add: body
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeHeader [

	header := self instantiate: SpkInspectorPaneHeader on: model.
	self layout
		add: header
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkInspectorPane >> initializePresenters [

	self
		initializeHeader;
		initializeBody;
		initializeAddEvaluatorButton
]

{ #category : 'accessing' }
SpkInspectorPane >> menuActions [

	^ CmCommandGroup forSpec
		  beRoot;
		  register: ((SpkAddEvaluatorCommand forSpecContext: self)
				   iconProvider: SpkIconLibrary current;
				   yourself);
		  register: (SpkClosePaneCommand forSpecContext: self);
		  yourself
]

{ #category : 'accessing' }
SpkInspectorPane >> newLayout [

	^ SpkAccordianLayout newVertical
]
