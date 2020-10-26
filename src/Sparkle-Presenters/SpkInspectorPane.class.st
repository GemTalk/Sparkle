Class {
	#name : 'SpkInspectorPane',
	#superclass : 'SpkPane',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'adding' }
SpkInspectorPane >> initializeAddEvaluatorButton [

	| addEvaluatorButton |
	addEvaluatorButton := self newButton
		                      icon: (self iconNamed: #addEvaluator24);
		                      help: 'Add Evaluator';
		                      action: [ self addEvaluator ];
		                      yourself.
	self layout
		add: addEvaluatorButton
		withConstraints: [ :constraints | 
			constraints
				height: 40;
				yourself ]
]

{ #category : 'initialization' }
SpkInspectorPane >> initializeHeader [

	header := self instantiate: SpkInspectorPaneHeader on: model.
	self layout add: header withConstraints: [ :constraints | 
		constraints
			height: 24;
			yourself ]
]

{ #category : 'initialization' }
SpkInspectorPane >> initializePresenters [

	self
		initializeHeader;
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
