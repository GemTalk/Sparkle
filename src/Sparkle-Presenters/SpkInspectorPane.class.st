"
I'm the top-level presenter of a Sparkle inspector.
I live in a column.
My responsibility is dividing the space between these elements:
* The InspectorPane proper (header, printString, field list)
* Zero or more evaluator subpanes
* The addEvaluator button

    Instance Variables
*	addEvaluatorButton:		<SpkIconButtonPresenter>
*	evaluators:		<OrderedCollection of SpkEvaluator>
*	nextEvaluatorIndex:		<SmallInteger>
*  pane:							<SpkInspectorPane

    Implementation Points

I don't have a coordinate; my pane has that.
"
Class {
	#name : 'SpkInspectorPane',
	#superclass : 'SpkPane',
	#instVars : [
		'addEvaluatorButton',
		'inspectorSubPane',
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
	evaluator pane: self.
	self evaluators add: evaluator.
	self updateEvaluatorIndices.
	self layout add: evaluator before: addEvaluatorButton
]

{ #category : 'copying' }
SpkInspectorPane >> copyOop [

	inspectorSubPane copyOop
]

{ #category : 'accessing' }
SpkInspectorPane >> enabled: aBoolean [

	"selfDescription is not a presenter, so does not get
	taken care of automatically."

	super enabled: aBoolean.
	selfDescription ifNotNil: [ :sd | sd enabled: aBoolean ]
]

{ #category : 'initialization' }
SpkInspectorPane >> evaluators [

	^ evaluators ifNil: [ evaluators := OrderedCollection new ]
]

{ #category : 'accessing' }
SpkInspectorPane >> evaluatorsWithLinkedPanes [

	^ self evaluators select: [ :each | each linkedPane notNil ]
]

{ #category : 'private-traversing' }
SpkInspectorPane >> extraPresenters [

	^ super extraPresenters , self evaluators
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

{ #category : 'adding' }
SpkInspectorPane >> initializeEvaluators [

	model evaluators do: [ :evaluatorModel | 
		self addEvaluatorWithModel: evaluatorModel ]
]

{ #category : 'adding' }
SpkInspectorPane >> initializeInspectorSubPane [

	inspectorSubPane := self instantiate: SpkInspectorSubPane on: model.
	inspectorSubPane pane: self.
	self layout add: inspectorSubPane
]

{ #category : 'initialization' }
SpkInspectorPane >> initializePresenters [

	super initializePresenters.
	self
		initializeInspectorSubPane;
		initializeAddEvaluatorButton;
		initializeEvaluators
]

{ #category : 'accessing' }
SpkInspectorPane >> menuCommandClasses [

	^ { 
		  SpkViewRawCommand.
		  SpkCopyOopCommand }
]

{ #category : 'instance creation' }
SpkInspectorPane >> newLayout [

	"Splitters are wanted between the inspector pane and each evaluator."

	^ SpkAccordianLayout newVertical
		  color: Color veryVeryDarkGray;
		  yourself
]

{ #category : 'accessing' }
SpkInspectorPane >> nextEvaluatorIndex [

	^ nextEvaluatorIndex ifNil: [ nextEvaluatorIndex := 1 ]
]

{ #category : 'actions' }
SpkInspectorPane >> openLinkedPane: newService forItem: item [

	inspectorSubPane openLinkedPane: newService forItem: item
]

{ #category : 'accessing' }
SpkInspectorPane >> panesLinkedToEvaluators [

	^ self evaluators
		  collect: [ :each | each linkedPane ]
		  thenSelect: [ :each | each notNil ]
]

{ #category : 'removing' }
SpkInspectorPane >> removeEvaluator: anEvaluator [

	model removeEvaluator: anEvaluator model.
	layout remove: anEvaluator.
	evaluators remove: anEvaluator.
	self updateEvaluatorIndices.
]

{ #category : 'updating' }
SpkInspectorPane >> updateEvaluatorIndices [

	"Update the assigned indices for each evaluator
	because the list of evaluators has or may have changed
	or because the numbers of fields has changes."

	self updateEvaluatorIndicesForListSize: inspectorSubPane listSize
]

{ #category : 'as yet unclassified' }
SpkInspectorPane >> updateEvaluatorIndicesForListSize: listSize [

	"Update the assigned indices for each evaluator
	because the list of evaluators has or may have changed
	or because the numbers of fields has changes."

	self evaluators withIndexDo: [ :each :evaluatorIndex | 
		each index: listSize + evaluatorIndex ]
]
