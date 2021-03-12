Class {
	#name : 'SpkInspectorPane',
	#superclass : 'SpkPaneWithList',
	#instVars : [
		'topLayout',
		'description',
		'fieldListIsShown',
		'addEvaluatorButton',
		'evaluators',
		'nextEvaluatorIndex',
		'fieldsTwizzle',
		'selfDescription',
		'fieldList'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'adding' }
SpkInspectorPane >> addEvaluator [

	self addEvaluatorWithModel: model addEvaluator
]

{ #category : 'adding' }
SpkInspectorPane >> addEvaluatorWithModel: evaluatorService [

	| evaluator |
	evaluator := self instantiate: SpkEvaluator on: evaluatorService.
	evaluator
		pane: self;
		index: self nextEvaluatorIndex.
	nextEvaluatorIndex := self nextEvaluatorIndex + 1.
	self evaluators add: evaluator.
	self layout add: evaluator before: addEvaluatorButton
]

{ #category : 'initialization' }
SpkInspectorPane >> connectPresenters [

	super connectPresenters.
	model
		when: SpkUpdateAnnouncement
		send: #updateFromModel
		to: self
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> deselectChangedFields [

	self
		deselectOffTheEndFields;
		deselectIdentityChangedFields
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> deselectIdentityChangedFields [

	| oldFields newFields |
	oldFields := listModel items.
	newFields := model fields.
	1 to: (newFields size min: oldFields size) do: [ :i | 
		| oldField newField |
		oldField := oldFields at: i.
		newField := newFields at: i.
		oldField model == newField ifFalse: [ 
			listModel deselectItem: oldField ] ]
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> deselectOffTheEndFields [

	| newNumberOfFields |
	newNumberOfFields := model fields size.
	listModel deselectItemsBeyond: newNumberOfFields
]

{ #category : 'initialization' }
SpkInspectorPane >> evaluators [

	^ evaluators ifNil: [ evaluators := OrderedCollection new ]
]

{ #category : 'initialization' }
SpkInspectorPane >> headerClass [

	^ SpkInspectorPaneHeader
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

	fieldListIsShown := true.
	self
		initializeSelfDescription;
		initializeFieldList
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeDescription [
	self flag: 'Update'.
	description := self newLabel
		               label: model selfDescription;
		               yourself.
	topLayout add: description withConstraints: [ :c | c fill: false ]
]

{ #category : 'adding' }
SpkInspectorPane >> initializeEvaluators [

	model evaluators do: [ :evaluatorModel | 
		self addEvaluatorWithModel: evaluatorModel ]
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeFieldList [

	self flag: 'Need a field list'
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeListColumns [

	self flag: 'Number of columns will be variable by view and class of inspected object'.
	list
		addColumnEvaluated: [ :item | item columnAt: 1 ];
		addColumnEvaluated: [ :item | item columnAt: 2 ]
]

{ #category : 'initialization' }
SpkInspectorPane >> initializePresenters [

	super initializePresenters.
	self
		initializeBody;
		initializeAddEvaluatorButton;
		initializeEvaluators
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeSelfDescription [

	selfDescription := self instantiate: SpkTwizzledString.
	selfDescription
		pane: self;
		labelString: model selfDescription;
		bodyString: model selfDescription.
	self layout add: selfDescription
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeTop [

	self flag: 'Update'.
	topLayout := SpkBoxLayout newHorizontal.
	self layout add: topLayout withConstraints: [ :c | c height: 25 ].
	self
		initializeFieldsTwizzle;
		initializeDescription
]

{ #category : 'actions' }
SpkInspectorPane >> itemSelected: anAnnouncement [

	"This announcement comes from the UI, not a service, so does not need to be deferred."

	| field inspectorService |
	field := anAnnouncement item.
	inspectorService := field model inspectFieldForRequest: field.
	"If nil, a server round trip is required and the inspector pane 
	will be created by announcement from the service."
	inspectorService
		ifNil: [ self disableAll ]
		ifNotNil: [ self openLinkedPane: inspectorService forItem: field ]
]

{ #category : 'accessing' }
SpkInspectorPane >> linkedPanes [

	^ super linkedPanes , self panesLinkedToEvaluators
]

{ #category : 'accessing' }
SpkInspectorPane >> menuActions [

	^ super menuActions
		  register: ((SpkViewRawCommand forSpecContext: self)
				   iconProvider: SpkIconLibrary current;
				   yourself);
		  yourself
]

{ #category : 'accessing' }
SpkInspectorPane >> nextEvaluatorIndex [

	^ nextEvaluatorIndex ifNil: [ nextEvaluatorIndex := 1 ]
]

{ #category : 'accessing' }
SpkInspectorPane >> panesLinkedToEvaluators [

	^ self evaluators
		  collect: [ :each | each linkedPane ]
		  thenSelect: [ :each | each notNil ]
]

{ #category : 'private-traversing' }
SpkInspectorPane >> presentersDo: aBlock [

	super presentersDo: aBlock.
	evaluators do: aBlock
]

{ #category : 'printing' }
SpkInspectorPane >> printOn: aStream [

	super printOn: aStream.
	model ifNotNil: [ 
		[ 
		| classMembership oop |
		classMembership := model classMembershipDescription.
		oop := model oop.
		aStream
			<< ' for ';
			<< classMembership;
			space.
		oop printOn: aStream base: 16 ]
			on: Error
			do: [ :ex | ex return ] ]
]

{ #category : 'removing' }
SpkInspectorPane >> removeEvaluator: anEvaluator [

	model removeEvaluator: anEvaluator model.
	layout remove: anEvaluator.
	evaluators remove: anEvaluator
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> updateFieldList [

	self
		deselectChangedFields;
		refreshListModel;
		refreshList
]

{ #category : 'initialization' }
SpkInspectorPane >> updateFromModel [

	self flag: 'Slight update'.
	description label: model selfDescription.
	header classMembershipDescription: model classMembershipDescription.
	self updateFieldList
]

{ #category : 'accessing' }
SpkInspectorPane >> updateInspectors [

	self evaluators do: [ :each | each updateInspectors ]
]
