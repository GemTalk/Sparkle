Class {
	#name : 'SpkInspectorPane',
	#superclass : 'SpkPane',
	#instVars : [
		'body',
		'addEvaluatorButton',
		'linkedInspectors',
		'evaluators',
		'nextEvaluatorIndex'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'adding' }
SpkInspectorPane >> addEvaluatorWithModel: evaluatorService [

	| evaluator |
	evaluator := self instantiate: SpkEvaluator on: evaluatorService.
	evaluator
		pane: self;
		index: self nextEvaluatorIndex.
	nextEvaluatorIndex := self nextEvaluatorIndex + 1.
	self evaluators add: evaluator.
	self layout add: evaluator
]

{ #category : 'initialization' }
SpkInspectorPane >> connectPresenters [

	super connectPresenters.
	model when: SpkNewPaneService send: #receiveLinkedPaneAnnouncement: to: self
]

{ #category : 'initialization' }
SpkInspectorPane >> evaluators [

	^ evaluators ifNil: [ evaluators := OrderedCollection new ]
]

{ #category : 'actions' }
SpkInspectorPane >> fieldDeselected: anAnnouncement [

	"This announcement comes from the UI, not a service"

	| field |
	field := anAnnouncement item.
	owner nextRightColumn remove: field linkedPane.
	field clearLinkedPane
]

{ #category : 'actions' }
SpkInspectorPane >> fieldSelected: anAnnouncement [

	"This announcement comes from the UI, not a service, so does not need to be deferred."

	| field inspectorService |
	field := anAnnouncement item.
	inspectorService := field model inspectFieldForRequest: field.
	"If nil, a server round trip is required and the inspector pane 
	will be created by announcement from the service."
	inspectorService
		ifNil: [ self disableAll ]
		ifNotNil: [ self openInspector: inspectorService forItem: field ]
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

{ #category : 'adding' }
SpkInspectorPane >> initializeEvaluators [

	model evaluators do: [ :evaluatorModel | 
		self addEvaluatorWithModel: evaluatorModel ]
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
		initializeEvaluators;
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
SpkInspectorPane >> newPaneForService: newService linkedTo: item [
	"Item is an InspectorField or an evaluator"

	self openInspector: newService forItem: item.
	"This announcement came from the server, so all of my widgets are disabled."
	self reEnableAll
]

{ #category : 'accessing' }
SpkInspectorPane >> nextEvaluatorIndex [

	^ nextEvaluatorIndex ifNil: [ nextEvaluatorIndex := 1 ]
]

{ #category : 'actions' }
SpkInspectorPane >> openInspector: anInspectorService forItem: item [

	" Create and open an inspector pane in the next column.
	item is an InspectorField or an evaluator."

	| nextRightColumn newPane |
	nextRightColumn := owner nextRightColumn.
	newPane := nextRightColumn presenterForService: anInspectorService.
	"Linked inspectors for fields get a 0 element in their coordinate. 
	Ones for evaluators get the evaluator's index."
	newPane coordinate: (item coordinateRelativeTo: coordinate).
	item linkedPane: newPane.
	nextRightColumn add: newPane.
	self flag:
		'Probably need a different kind of refresh for an evaluator'.
	body refreshFieldList "Change linking arrow."
]

{ #category : 'announcements' }
SpkInspectorPane >> receiveLinkedPaneAnnouncement: anAnnouncement [

	self defer: [ 
		self
			newPaneForService: anAnnouncement service
			linkedTo: anAnnouncement requestId ]
]
