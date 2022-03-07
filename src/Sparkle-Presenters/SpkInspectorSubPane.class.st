Class {
	#name : 'SpkInspectorSubPane',
	#superclass : 'SpkPresenterWithModel',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'selfDescription',
		'viewTwizzle',
		'currentView',
		'views'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'events' }
SpkInspectorSubPane >> closeRequestedLocally [

	self pane closeRequestedLocally
]

{ #category : 'actions' }
SpkInspectorSubPane >> copyOop [ 

	"Put the oop of the inspected object on the clipboard as a hex string 
	(the same as it's displayed in the header)"
	
	Clipboard clipboardText: model oop hex.
]

{ #category : 'refreshing' }
SpkInspectorSubPane >> currentView: aView [

	currentView ifNotNil: [ :v | v close ].
	currentView := aView.
	currentView refresh
]

{ #category : 'as yet unclassified' }
SpkInspectorSubPane >> deselectChangedFields [

	self
		deselectOffTheEndFields;
		deselectIdentityChangedFields
]

{ #category : 'as yet unclassified' }
SpkInspectorSubPane >> deselectIdentityChangedFields [

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
SpkInspectorSubPane >> deselectOffTheEndFields [

	| newNumberOfFields |
	newNumberOfFields := model fields size.
	listModel deselectItemsBeyondIndex: newNumberOfFields
]

{ #category : 'actions' }
SpkInspectorSubPane >> disableAll [

	self pane disableAll
]

{ #category : 'accessing' }
SpkInspectorSubPane >> enabled: aBoolean [

	"selfDescription is not a presenter, so does not get
	taken care of automatically."

	super enabled: aBoolean.
	selfDescription ifNotNil: [ :sd | sd enabled: aBoolean ]
]

{ #category : 'accessing' }
SpkInspectorSubPane >> evaluatorsWithLinkedPanes [

	^ owner evaluatorsWithLinkedPanes
]

{ #category : 'initialization' }
SpkInspectorSubPane >> headerClass [

	^ SpkInspectorPaneHeader
]

{ #category : 'initialization' }
SpkInspectorSubPane >> initializeListColumns [

	list
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item columnAt: 1 ]);
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item columnAt: 2 ])
]

{ #category : 'initialization' }
SpkInspectorSubPane >> initializePresenters [

	super initializePresenters.

	self
		initializeHeader;
		initializeViewPresenters
]

{ #category : 'initialization' }
SpkInspectorSubPane >> initializeSelfDescription [

	selfDescription := self instantiate: SpkTwizzledString.
	selfDescription twizzleHelp: 'Show or hide the full printString'.
	self updateSelfDescription
]

{ #category : 'initialization' }
SpkInspectorSubPane >> initializeTwizzledList [

	self initializeList.
	viewTwizzle := self instantiate: SpkTwizzledPresenter.
	viewTwizzle
		subPresenter: list;
		showSubPresenter: true
]

{ #category : 'initialization' }
SpkInspectorSubPane >> initializeViewPresenters [

	self
		initializeSelfDescription;
		addSeparator;
		initializeViews;
		initializeViewTwizzle.
	viewTwizzle twizzleHelp: 'Show or hide the field list'
]

{ #category : 'initialization' }
SpkInspectorSubPane >> initializeViewTwizzle [

	viewTwizzle := self instantiate: SpkTwizzledPresenter.
	viewTwizzle
		subPresenter: currentView;
		showSubPresenter: true
]

{ #category : 'initialization' }
SpkInspectorSubPane >> initializeViews [
	
	views := model views collect: [ :each | self presenterForService: each ].
	currentView := views first "Default is always first"
]

{ #category : 'accessing' }
SpkInspectorSubPane >> itemsWithLinkedPanes [

	"Each view may have linked panes, 
	even when it is not the current view."

	| items |
	items := OrderedCollection new.
	views do: [ :each | items addAll: each itemsWithLinkedPanes ].
	^ items
]

{ #category : 'as yet unclassified' }
SpkInspectorSubPane >> listLabelString [

	^ self listItemServices size printString , ' fields'
]

{ #category : 'accessing' }
SpkInspectorSubPane >> nonChildSlotNames [ 
	^ super nonChildSlotNames , #( #pane )
]

{ #category : 'accessing' }
SpkInspectorSubPane >> panesLinkedToEvaluators [

	^ owner panesLinkedToEvaluators
]

{ #category : 'printing' }
SpkInspectorSubPane >> printOn: aStream [

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

{ #category : 'initialization' }
SpkInspectorSubPane >> refreshFromService [

	"Must be sent in the UI thread."

	self header classMembershipDescription:
		model classMembershipDescription.
	self
		updateSelfDescription;
		refreshViews;
		updateViewMenu
]

{ #category : 'initialization' }
SpkInspectorSubPane >> refreshTwizzledList [

	self refreshViews.
	viewTwizzle labelString: self listLabelString
]

{ #category : 'refreshing' }
SpkInspectorSubPane >> refreshViews [

	| oldViews |
	oldViews := views.

	views := model views collect: [ :viewService | 
		         oldViews
			         detect: [ :existingView | 
			         existingView model == viewService ]
			         ifNone: [ self presenterForService: viewService ] ].

	(views includes: currentView) ifFalse: [ 
		self currentView: views first "Default" ]
]

{ #category : 'as yet unclassified' }
SpkInspectorSubPane >> updateFieldList [

	self
		deselectChangedFields;
		refreshTwizzledList.
]

{ #category : 'updating' }
SpkInspectorSubPane >> updateLinkedPaneCoordinates [

	self flag: 'Not yet correct for views'.
	"Copy the body of the trait implementation here, since trait aliasing does not seem to work. "
	self itemsWithLinkedPanes do: [ :item | 
		item linkedPane coordinate:
			(item coordinateRelativeTo: self pane coordinate) ].

	"Then, update the evaluators in case the list size has changed."
	self pane updateEvaluatorIndices
]

{ #category : 'initialization' }
SpkInspectorSubPane >> updateSelfDescription [

	selfDescription
		labelString: model selfDescription;
		bodyString: model selfDescription
]

{ #category : 'as yet unclassified' }
SpkInspectorSubPane >> updateViewMenu [

	self flag: 'Need to generate menu dynamically from views'.
	self header menu: self pane menuCommandGroup asMenuPresenter
]
