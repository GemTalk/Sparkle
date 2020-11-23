Class {
	#name : 'SpkInspectorPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTLayoutService',
	#classTraits : 'SpkTLayoutService classTrait',
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

{ #category : 'announcements' }
SpkInspectorPane >> deferNewSubInspector: anAnnouncement [

	self defer: [ self newSubInspector: anAnnouncement ]
]

{ #category : 'actions' }
SpkInspectorPane >> fieldDeselected: anAnnouncement [

	self halt.
]

{ #category : 'actions' }
SpkInspectorPane >> fieldSelected: anAnnouncement [

	| inspectorPane field |
	field := anAnnouncement item.
	inspectorPane := linkedInspectors at: field ifAbsent: [ nil ].
	inspectorPane ifNotNil: [ :ip | 
		ip hide.
		^ self ].
	self disableAll.
	model inspect: field model
	"The inspector will be given to us by announcement"
]

{ #category : 'initialization' }
SpkInspectorPane >> initialize [

	super initialize.
	evaluators := OrderedCollection new.
	linkedInspectors := IdentityDictionary new
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

{ #category : 'instance creation' }
SpkInspectorPane >> newSubInspector: anAnnouncement [

	| field |
	field := self fieldForService: anAnnouncement requestId.

	self halt.
]
