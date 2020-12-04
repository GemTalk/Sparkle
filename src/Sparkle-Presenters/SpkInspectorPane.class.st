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
	model when: SpkInspectorCreated send: #deferNewLinkedInspector: to: self
]

{ #category : 'announcements' }
SpkInspectorPane >> deferNewLinkedInspector: anAnnouncement [

	anAnnouncement requestId inspectorService: anAnnouncement service.
	self defer: [ self newLinkedInspector: anAnnouncement ]
]

{ #category : 'actions' }
SpkInspectorPane >> fieldDeselected: anAnnouncement [

	"This announcement comes from the UI, not a service"

	| field |
	field := anAnnouncement item.
	owner nextRightColumn remove: field linkedPane.
	field clearLinkedPane
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> fieldForService: aService [

	"Find and answer the field presenter with the given service as its model."

	^ body fieldForService: aService
]

{ #category : 'actions' }
SpkInspectorPane >> fieldSelected: anAnnouncement [

	"This announcement comes from the UI, not a service"

	| field inspectorService |
	field := anAnnouncement item.
	inspectorService := model inspectField: field model.
	"If nil, a server round trip is required and the inspector pane 
	will be created by announcement from the service."
	inspectorService
		ifNil: [ self disableAll ]
		ifNotNil: [ self openInspector: inspectorService forField: field ]
]

{ #category : 'initialization' }
SpkInspectorPane >> initialize [

	super initialize.
	evaluators := OrderedCollection new
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
SpkInspectorPane >> newLinkedInspector: anAnnouncement [

	| field newService |
	field := self fieldForService: anAnnouncement requestId.
	newService := anAnnouncement service.
	self openInspector: newService forField: field.
	"This announcement came from the server, so all of my widgets are disabled."
	self reEnableAll
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> openInspector: anInspectorService forField: field [

	" Create and open an inspector pane in the next column"

	| nextRightColumn newPane |
	nextRightColumn := owner nextRightColumn.
	newPane := nextRightColumn presenterForService: anInspectorService.
	"Linked inspectors for fields get a 0 element in their coordinate. 
	Ones for evaluators get the evaluator's index."
	newPane coordinate: coordinate , 0 , field index.
	field linkedPane: newPane.
	nextRightColumn add: newPane.
	body refreshFieldList "Change linking arrow."
]