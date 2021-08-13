"
I am a concrete class.

My purpose is to display and handle a code snippet that is (hopefully) executable, but is not a method in that it doesn't have a message pattern like a full method would.

* pane 	<SpkInspectorPane> The inspector pane that I'm part of.
* index 	<Integer>		My index as an inspector. First evaluator for a pane is index 1. The index of a closed evaluator is not reused.
* linkedPane		<SpkPane or nil>		A pane in the next column showing the result of my evaluation.
"
Class {
	#name : 'SpkEvaluator',
	#superclass : 'SpkCodeSubPane',
	#traits : 'SpkTLinkedPane',
	#classTraits : 'SpkTLinkedPane classTrait',
	#instVars : [
		'pane',
		'index'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkEvaluator >> accept [

	pane disableAll.
	model acceptFor: self
]

{ #category : 'actions' }
SpkEvaluator >> cancel [

	"Ignore ctrl-l if no unsaved changes"

	self flag:
		'The command itself and menu item should be disabled instead of this test.'.
	model hasUnsavedChanges ifTrue: [ model cancel ]
]

{ #category : 'events' }
SpkEvaluator >> closeRequestedLocally [

	linkedPane ifNotNil: [ :p | p close ].
	model unsubscribe: self.
	"My owner is an InspectorPane"
	owner removeEvaluator: self
]

{ #category : 'events' }
SpkEvaluator >> closingLinkedPane: aPane [

	self linkedPane == aPane ifFalse: [ 
		self error: 'Only my linked pane should notify me when closing.' ].
	self clearLinkedPane
]

{ #category : 'accessing' }
SpkEvaluator >> column [

	"What column am I in? The same column as the pane I'm part of."

	^ pane column
]

{ #category : 'initialization' }
SpkEvaluator >> connectPresenters [

	super connectPresenters.
	header menu: self menuCommandGroup asMenuPresenter.
	codePresenter text: model newSourceCode.
	self hasUnsavedChanges: model hasUnsavedChanges.
	codePresenter whenTextChangedDo: [ :newText | 
		model newSourceCode: newText asString ].
	model
		when: SpkContentsChangedAnnouncement
		send: #contentsChanged:
		to: self;
		when: SpkUnsavedChangesAnnouncement
		send: #receiveUnsavedChangesAnnouncement:
		to: self
]

{ #category : 'events' }
SpkEvaluator >> contentsChanged: aContentsChangedAnnouncement [

	| newContents |
	newContents := aContentsChangedAnnouncement newContents.
	newContents = codePresenter text asString ifFalse: [ 
		self halt: 'update text here' ]
]

{ #category : 'accessing' }
SpkEvaluator >> coordinateRelativeTo: parentCoordinate [

	"Linked inspectors for fields get a 0 element in their coordinate. 
	Ones for evaluators get the evaluator's index. This sorts all fields before any evaluators."

	^ parentCoordinate , index
]

{ #category : 'actions' }
SpkEvaluator >> debug [

	pane disableAll.
	model debugFor: self
]

{ #category : 'updates' }
SpkEvaluator >> hasUnsavedChanges: aBoolean [

	codePresenter hasUnacceptedEdits: aBoolean
]

{ #category : 'accessing' }
SpkEvaluator >> index [

	^ index
]

{ #category : 'accessing' }
SpkEvaluator >> index: anIndex [

	index = anIndex
		ifTrue: [ ^self ].
	index := anIndex.
	self linkedPane ifNotNil: [:lp | lp coordinate: (self coordinateRelativeTo: owner coordinate)]
]

{ #category : 'initialization' }
SpkEvaluator >> initializeHeader [

	header := self instantiate: SpkEvaluatorHeader on: model.
	self layout add: header withConstraints: [ :c | c height: 30 ]
]

{ #category : 'initialization' }
SpkEvaluator >> initializePresenters [

	super initializePresenters.
	self layout add: codePresenter.
	codePresenter placeholder: 'Accept to evaluate code typed here.'
]

{ #category : 'instance creation' }
SpkEvaluator >> menuCommandGroup [

	^ CmCommandGroup forSpec
		  beRoot;
		  register: (codePresenter class codeAcceptCommandsGroupWith: self);
		  register:
			  (codePresenter class textEditionCommandsGroupWith: codePresenter);
		  "register: (self class sourceCodeCommandsGroupWith: self);"
		  yourself
]

{ #category : 'accessing' }
SpkEvaluator >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'accessing' }
SpkEvaluator >> nonChildSlotNames [

	"linkedPane slot is defined in the SpkLinkedPane trait"

	^ super nonChildSlotNames , #( #pane #linkedPane )
]

{ #category : 'accessing' }
SpkEvaluator >> pane: anObject [

	pane := anObject
]

{ #category : 'layout' }
SpkEvaluator >> paneLabel [
	^ self newLabel
		  label: 'Evaluator';
		  yourself
]

{ #category : 'events' }
SpkEvaluator >> receiveUnsavedChangesAnnouncement: anSpkUnsavedChangesAnnouncement [

	self defer: [ 
		self hasUnsavedChanges:
			anSpkUnsavedChangesAnnouncement hasUnsavedChanges ]
]
