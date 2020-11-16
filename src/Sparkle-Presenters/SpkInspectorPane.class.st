Class {
	#name : 'SpkInspectorPane',
	#superclass : 'SpkPane',
	#instVars : [
		'body',
		'addEvaluatorButton',
		'linkedInspectors',
		'evaluators'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkInspectorPane >> connectPresenters [

	super connectPresenters.
	model when: SpkInspectorCreated send: #deferNewSubInspector: to: self
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> fieldDeselected: anAnnouncement [

	self halt.
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> fieldSelected: anAnnouncement [

	| inspectorPane |
	inspectorPane := linkedInspectors
		                 at: anAnnouncement index
		                 ifAbsent: [ nil ].
	inspectorPane ifNil: [ 
		self disableAll.
		self halt.
		model inspectFieldAt: anAnnouncement index ]
]

{ #category : 'initialization' }
SpkInspectorPane >> initialize [

	super initialize.
	evaluators := OrderedCollection new.
	linkedInspectors := OrderedCollection new
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
