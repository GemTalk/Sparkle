Class {
	#name : 'SpkInspectorPane',
	#superclass : 'SpkPaneWithList',
	#instVars : [
		'topLayout',
		'twizzle',
		'description',
		'fieldListIsShown',
		'addEvaluatorButton',
		'evaluators',
		'nextEvaluatorIndex'
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
		when: SpkInspectorUpdateAnnouncement
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
		initializeTop;
		initializeList;
		updateFieldListVisibility
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeDescription [

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
SpkInspectorPane >> initializeListColumns [

	self list
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item columnAt: 1 ]);
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item columnAt: 2 ])
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
SpkInspectorPane >> initializeTop [

	topLayout := SpkBoxLayout newHorizontal.
	self layout add: topLayout withConstraints: [ :c | c height: 25 ].
	self
		initializeTwizzle;
		initializeDescription
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeTwizzle [

	twizzle := self newIconButton
		           icon: self twizzleIcon;
		           help: 'Show or hide the field list';
		           action: [ self toggleFieldList ];
		           yourself.
	topLayout add: twizzle withConstraints: [ :c | 
		c
			fill: false;
			width: 20;
			height: 20 ]
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
SpkInspectorPane >> listItemModels [

	^ model fields
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

{ #category : 'actions' }
SpkInspectorPane >> toggleFieldList [

	fieldListIsShown := fieldListIsShown not.
	self
		updateTwizzleIcon;
		updateFieldListVisibility
]

{ #category : 'initialization' }
SpkInspectorPane >> twizzleIcon [

	^ fieldListIsShown
		  ifTrue: [ self iconNamed: #treeExpanded ]
		  ifFalse: [ self iconNamed: #treeUnexpanded ]
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> updateFieldList [

	self
		deselectChangedFields;
		refreshListModel;
		refreshList
]

{ #category : 'initialization' }
SpkInspectorPane >> updateFieldListVisibility [

	fieldListIsShown
		ifTrue: [ self layout add: self list after: topLayout ]
		ifFalse: [ self layout remove: self list ]
]

{ #category : 'initialization' }
SpkInspectorPane >> updateFromModel [

	description label: model selfDescription.
	header classMembershipDescription: model classMembershipDescription.
	self updateFieldList
]

{ #category : 'accessing' }
SpkInspectorPane >> updateInspectors [

	self evaluators do: [ :each | each updateInspectors ]
]

{ #category : 'actions' }
SpkInspectorPane >> updateTwizzleIcon [

	twizzle icon: self twizzleIcon
]
