"
I am a concrete class.

My purpose is to display and handle a code snippet that is (hopefully) executable, but is not a method in that it doesn't have a message pattern like a full method would.
"
Class {
	#name : 'SpkEvaluator',
	#superclass : 'SpkCodeSubPane',
	#instVars : [
		'index'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkEvaluator >> connectPresenters [

	super connectPresenters.
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

{ #category : 'as yet unclassified' }
SpkEvaluator >> contentsChanged: aContentsChangedAnnouncement [

	| newContents |
	newContents := aContentsChangedAnnouncement newContents.
	newContents = codePresenter text asString ifFalse: [ 
		self halt: 'update text here' ]
]

{ #category : 'testing' }
SpkEvaluator >> hasUnsavedChanges: aBoolean [

	codePresenter hasUnacceptedEdits: aBoolean
]

{ #category : 'accessing' }
SpkEvaluator >> index [

	^ index
]

{ #category : 'accessing' }
SpkEvaluator >> index: anObject [

	index := anObject
]

{ #category : 'initialization' }
SpkEvaluator >> initializePresenters [

	super initializePresenters.
	self layout add: codePresenter.
	codePresenter
		placeholder: 'Accept to evaluate code typed here.';
		whenSubmitDo: [ :ignored | model accept ];
		whenResetDo: [ model cancel ]
]

{ #category : 'instance creation' }
SpkEvaluator >> menuActions [

	^ CmCommandGroup forSpec
		  beRoot;
		  register: (codePresenter class codeAcceptCommandsGroupWith: self);
		  register: (self class undoRedoCommandsGroupWith: self);
		  register:
			  (codePresenter class textEditionCommandsGroupWith: codePresenter);
		  register: (self class sourceCodeCommandsGroupWith: self);
		  register: (SpkClosePaneCommand forSpecContext: self);
		  yourself
]

{ #category : 'accessing' }
SpkEvaluator >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'instance creation' }
SpkEvaluator >> oldPaneMenu [

	self flag: 'ObsoleteMethod?'.
	^ self newMenu
		  addGroup: [ :group | 
			  group
				  addItem: [ :item | 
					  item
						  name: 'Accept';
						  shortcut: $s ctrl;
						  icon: (self iconNamed: #glamorousAccept);
						  action: [ model inform: 'Accept' ];
						  yourself ];
				  addItem: [ :item | 
					  item
						  name: 'Cancel';
						  shortcut: $l ctrl;
						  icon: (self iconNamed: #glamorousCancel);
						  action: [ model ];
						  yourself ] ];
		  addGroup: [ :group | 
			  group
				  addItem: [ :item | 
					  item
						  name: 'Undo';
						  shortcut: $z ctrl;
						  icon: (self iconNamed: #glamorousUndo);
						  action: [ model inform: 'Got Undid' ];
						  yourself ];
				  addItem: [ :item | 
					  item
						  name: 'Redo';
						  shortcut: $z ctrl shift;
						  icon: (self iconNamed: #glamorousRedo);
						  action: [ model inform: 'Got Re-did' ];
						  yourself ] ];
		  addGroup: [ :group | 
			  group
				  addItem: [ :item | 
					  item
						  name: 'Cut';
						  shortcut: $x ctrl;
						  icon: (self iconNamed: #smallCut);
						  action: [ model inform: 'Cut' ];
						  yourself ];
				  addItem: [ :item | 
					  item
						  name: 'Copy';
						  shortcut: $c ctrl;
						  icon: (self iconNamed: #smallCopy);
						  action: [ model inform: 'Copy' ];
						  yourself ];
				  addItem: [ :item | 
					  item
						  name: 'Paste';
						  shortcut: $v ctrl;
						  icon: (self iconNamed: #smallPaste);
						  action: [ model inform: 'Paste' ];
						  yourself ] ];
		  addGroup: [ :group | 
			  group
				  addItem: [ :item | 
					  item
						  name: 'Format';
						  shortcut: $f ctrl shift;
						  action: [ model inform: 'Format' ];
						  yourself ];
				  addItem: [ :item | 
					  item
						  name: 'Do it';
						  shortcut: $d ctrl;
						  icon: (self iconNamed: #smallDoIt);
						  action: [ model inform: 'DoIt' ];
						  yourself ] ];
		  addGroup: [ :group | 
			  group addItem: [ :item | 
				  item
					  name: 'Close pane';
					  shortcut: $w ctrl;
					  action: [ self closeRequestedLocally ];
					  yourself ] ];
		  yourself
]

{ #category : 'layout' }
SpkEvaluator >> paneLabel [
	^ self newLabel
		  label: 'Evaluator';
		  yourself
]

{ #category : 'testing' }
SpkEvaluator >> receiveUnsavedChangesAnnouncement: anSpkUnsavedChangesAnnouncement [

	self defer: [ 
		self hasUnsavedChanges:
			anSpkUnsavedChangesAnnouncement hasUnsavedChanges ]
]
