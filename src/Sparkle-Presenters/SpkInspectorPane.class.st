Class {
	#name : 'SpkInspectorPane',
	#superclass : 'SpkPane',
	#instVars : [
		'topLayout',
		'twizzle',
		'description',
		'fieldList',
		'fieldListIsShown',
		'fieldListModel',
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
	header menu: self menuActions asMenuPresenter.
	model when: SpkNewPaneService send: #receiveLinkedPaneAnnouncement: to: self
]

{ #category : 'initialization' }
SpkInspectorPane >> evaluators [

	^ evaluators ifNil: [ evaluators := OrderedCollection new ]
]

{ #category : 'actions' }
SpkInspectorPane >> fieldDeselected: anAnnouncement [

	"This announcement comes from the UI, not a service,
	so does not need to be deferred."

	| field |
	field := anAnnouncement item.
	"If the close was initiated by the linked pane, 
	it will already be closed and removed from the field."
	field linkedPane ifNotNil: [ :linkedPane | linkedPane close ].
	self updateSelection
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
		ifNotNil: [ self openLinkedPane: inspectorService forItem: field ]
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
		initializeFieldList;
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
SpkInspectorPane >> initializeFieldList [

	"Dynamically added to or removed from my layout upon twizzle click."

	self initializeFieldListModel.
	fieldList := self newTable.
	fieldList
		whenSelectionChangedDo: [ :selectionMode | 
			fieldListModel selectedIndexes: selectionMode selectedIndexes ];
		items: fieldListModel;
		addColumn: (SpStringTableColumn evaluated: #name);
		addColumn: (SpStringTableColumn evaluated: #description);
		addColumn: ((SpImageTableColumn evaluated: [ :field | 
					  field hasLinkedPane
						  ifTrue: [ self iconNamed: #hidePane16 ]
						  ifFalse: [ self iconNamed: #showPane16 ] ])
				 width: 25;
				 yourself);
		hideColumnHeaders
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeFieldListModel [

	| fields |
	fieldListModel := SpkMultiSelectList new.
	fields := model fields collect: [ :each | 
		          (SpkInspectorField for: each)
			          list: fieldListModel;
			          yourself ].
	fieldListModel
		addAll: fields;
		when: SpkItemSelected send: #fieldSelected: to: self;
		when: SpkItemDeselected send: #fieldDeselected: to: self
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeHeader [

	header := self instantiate: SpkInspectorPaneHeader on: model.
	self layout add: header withConstraints: [ :c | c height: 30 ]
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

{ #category : 'accessing' }
SpkInspectorPane >> linkedPanes [

	^ self panesLinkedToFields , self panesLinkedToEvaluators
]

{ #category : 'accessing' }
SpkInspectorPane >> menuActions [

	^ CmCommandGroup forSpec
		  beRoot;
		  register: ((SpkViewRawCommand forSpecContext: self)
				   iconProvider: SpkIconLibrary current;
				   yourself);
		  yourself
]

{ #category : 'accessing' }
SpkInspectorPane >> newLayout [

	^ SpkAccordianLayout newVertical
]

{ #category : 'instance creation' }
SpkInspectorPane >> newPaneForService: newService linkedTo: item [
	"Item is an InspectorField or an evaluator"

	self openLinkedPane: newService forItem: item.
	"This announcement came from the server, so all of my widgets are disabled."
	self reEnableAll
]

{ #category : 'accessing' }
SpkInspectorPane >> nextEvaluatorIndex [

	^ nextEvaluatorIndex ifNil: [ nextEvaluatorIndex := 1 ]
]

{ #category : 'actions' }
SpkInspectorPane >> openLinkedPane: aPaneService forItem: item [

	" Create and open an inspector pane in the next column.
	item is an InspectorField or an evaluator."

	| nextRightColumn newPane |
	nextRightColumn := owner nextRightColumn.
	"Ask the column, since it must own the new pane."
	newPane := nextRightColumn presenterForService: aPaneService.
	"Linked panes for fields get a 0 element in their coordinate. 
	Ones for evaluators get the evaluator's index."
	newPane coordinate: (item coordinateRelativeTo: coordinate).
	"Add before close so that the column doesn't become empty and remove itself"
	nextRightColumn add: newPane.
	item
		closeLinkedPane;
		linkedPane: newPane.
	self flag:
		'Probably need a different kind of refresh for an evaluator'.
	self refreshFieldList "Change linking arrow."
]

{ #category : 'accessing' }
SpkInspectorPane >> panesLinkedToEvaluators [

	^ self evaluators
		  collect: [ :each | each linkedPane ]
		  thenSelect: [ :each | each notNil ]
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> panesLinkedToFields [

	^ fieldListModel items
		  collect: [ :field | field linkedPane ]
		  thenSelect: [ :pane | pane notNil ]
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

{ #category : 'announcements' }
SpkInspectorPane >> receiveLinkedPaneAnnouncement: anAnnouncement [

	self defer: [ 
		self
			newPaneForService: anAnnouncement service
			linkedTo: anAnnouncement requestId ]
]

{ #category : 'actions' }
SpkInspectorPane >> refreshFieldList [

	"Re-draw the field list; sent when something has changed and must be re-displayed."

	fieldList refresh
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

{ #category : 'initialization' }
SpkInspectorPane >> updateFieldListVisibility [

	fieldListIsShown
		ifTrue: [ self layout add: fieldList after: topLayout ]
		ifFalse: [ self layout remove: fieldList ]
]

{ #category : 'updating' }
SpkInspectorPane >> updateSelection [

	"If the selected items are changed by means other than a mouse click,
	we must let the list know to display the correct selection."

	fieldList selectIndexes: fieldListModel selectedIndexes
]

{ #category : 'actions' }
SpkInspectorPane >> updateTwizzleIcon [

	twizzle icon: self twizzleIcon
]
