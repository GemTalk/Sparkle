Class {
	#name : 'SpkTonelTextPane',
	#superclass : 'SpkPane',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'codePresenter',
		'oldText'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Panes',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Panes'
}

{ #category : 'initialization' }
SpkTonelTextPane >> connectPresenters [

	super connectPresenters.
	self header menu: self menuCommandGroup asMenuPresenter.
	codePresenter whenTextChangedDo: [ :newText |
		self updateHasUnsavedChanges ].
	self hasUnsavedChanges: false
]

{ #category : 'testing' }
SpkTonelTextPane >> hasUnsavedChanges: aBoolean [

	codePresenter hasUnacceptedEdits: aBoolean
]

{ #category : 'accessing' }
SpkTonelTextPane >> headerClass [

	^ SpkTonelTextPaneHeader
]

{ #category : 'initialization' }
SpkTonelTextPane >> initializeCodePresenter [

	codePresenter := self instantiate: SpkTonelCodePresenter.
	codePresenter
		bindKeyCombination: $s meta toAction: [ self accept ];
		bindKeyCombination: $l meta toAction: [ self revert ]
]

{ #category : 'initialization' }
SpkTonelTextPane >> initializePresenters [

	super initializePresenters.
	self
		initializeHeader;
		initializeCodePresenter.
	self layout add: codePresenter
]

{ #category : 'accessing' }
SpkTonelTextPane >> menuCommandGroup [

	^ CmCommandGroup forSpec
		  beRoot;
		  register: (codePresenter class codeAcceptCommandsGroupWith: self);
		  register:
			  (codePresenter class textEditionCommandsGroupWith: codePresenter);
		  "register: (self class sourceCodeCommandsGroupWith: self);"
		  yourself
]

{ #category : 'initialization' }
SpkTonelTextPane >> refreshFromService [
	"Must be sent in the UI thread."

	| newText |
	self header labelString: model key.
	newText := model value.

	self flag:
		'This assumes that the refreshFromService is only sent after an accept or a cancel. True?'.
	oldText := newText.
	codePresenter text: newText
]

{ #category : 'actions' }
SpkTonelTextPane >> updateHasUnsavedChanges [

	| newText hasUnsavedChanges |
	newText := codePresenter text.
	hasUnsavedChanges := oldText ~= newText.
	codePresenter hasUnacceptedEdits: hasUnsavedChanges
]
