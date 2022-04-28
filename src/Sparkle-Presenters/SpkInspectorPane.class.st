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
		'evaluators'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'adding' }
SpkInspectorPane >> addEvaluator [

	self
		addEvaluatorWithModel: model addEvaluator;
		updateLinkedCoordinates
]

{ #category : 'adding' }
SpkInspectorPane >> addEvaluatorWithModel: evaluatorService [

	"Every evaluator gets a splitter above it."

	| evaluator |
	evaluator := self instantiate: SpkEvaluator on: evaluatorService.

	evaluators add: evaluator.
	self layout
		add: evaluator before: addEvaluatorButton;
		add: self newSplitter
		before: evaluator
		withConstraints: self splitterConstraints
]

{ #category : 'initialization' }
SpkInspectorPane >> connectPresenters [

	super connectPresenters.
	model
		when: SpkPaneServiceAnnouncement
		send: #receivePaneServiceAnnouncement:
		to: self
]

{ #category : 'copying' }
SpkInspectorPane >> copyOop [

	inspectorSubPane copyOop
]

{ #category : 'accessing' }
SpkInspectorPane >> evaluatorsWithLinkedPanes [

	^ evaluators select: [ :each | each linkedPane notNil ]
]

{ #category : 'private-traversing' }
SpkInspectorPane >> extraPresenters [

	^ super extraPresenters , evaluators
]

{ #category : 'accessing' }
SpkInspectorPane >> header [
	^ inspectorSubPane header
]

{ #category : 'initialization' }
SpkInspectorPane >> initialize [

	"I'm a presenter; super initialize needs to come after basic initialization."

	evaluators := OrderedCollection new.
	super initialize
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
		withConstraints: [ :constraints | constraints size: 26 ]
]

{ #category : 'adding' }
SpkInspectorPane >> initializeEvaluators [

	model evaluators do: [ :evaluatorModel | 
		self addEvaluatorWithModel: evaluatorModel ]
]

{ #category : 'adding' }
SpkInspectorPane >> initializeInspectorSubPane [

	inspectorSubPane := self instantiate: SpkInspectorSubPane on: model.
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
SpkInspectorPane >> linkedPanes [

	^ super linkedPanes , inspectorSubPane linkedPanes
	  , self panesLinkedToEvaluators
]

{ #category : 'instance creation' }
SpkInspectorPane >> newLayout [

	"Splitters are wanted between the inspector pane and each evaluator."

	^ SpkAccordianLayout newVertical
		  color: Color veryVeryDarkGray;
		  yourself
]

{ #category : 'accessing' }
SpkInspectorPane >> panesLinkedToEvaluators [

	^ evaluators
		  collect: [ :each | each linkedPane ]
		  thenSelect: [ :each | each notNil ]
]

{ #category : 'refreshing' }
SpkInspectorPane >> refreshFromService [

	inspectorSubPane refreshFromService.
	self updateLinkedCoordinates
]

{ #category : 'removing' }
SpkInspectorPane >> removeEvaluator: anEvaluator [

	| evaluatorIndex |
	model removeEvaluator: anEvaluator model.
	"Also remove the associated splitter, which is just before the evaluator"
	evaluatorIndex := self layout indexOfPresenter: anEvaluator.
	self layout
		removePresenterAtIndex: evaluatorIndex - 1;
		remove: anEvaluator.
	evaluators remove: anEvaluator.
	self updateLinkedCoordinates
]

{ #category : 'refreshing' }
SpkInspectorPane >> updateLinkedCoordinates [

	| coordinateSuffix |
	coordinateSuffix := 0.
	coordinateSuffix := inspectorSubPane updateCoordinatesBasedOn:
		                    coordinateSuffix.
	evaluators do: [ :evaluator | 
		coordinateSuffix := evaluator updateCoordinatesBasedOn:
			                    coordinateSuffix ]
]
