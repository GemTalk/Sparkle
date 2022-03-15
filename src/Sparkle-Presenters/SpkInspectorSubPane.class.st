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

	currentView := aView.
	viewTwizzle subPresenter: currentView
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
SpkInspectorSubPane >> initializePresenters [

	super initializePresenters.

	self
		initializeHeader;
		initializeSelfDescription;
		addSeparator;
		initializeViewTwizzle
]

{ #category : 'initialization' }
SpkInspectorSubPane >> initializeSelfDescription [

	selfDescription := self instantiate: SpkTwizzledString.
	selfDescription twizzleHelp: 'Show or hide the full printString'.
	self updateSelfDescription
]

{ #category : 'initialization' }
SpkInspectorSubPane >> initializeViewTwizzle [

	viewTwizzle := self instantiate: SpkTwizzledPresenter.
	viewTwizzle showSubPresenter: true
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

{ #category : 'accessing' }
SpkInspectorSubPane >> linkedPanes [

	^ self itemsWithLinkedPanes collect: [ :item | item linkedPane ]
]

{ #category : 'accessing' }
SpkInspectorSubPane >> nonChildSlotNames [ 
	^ super nonChildSlotNames , #( #pane )
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

{ #category : 'refreshing' }
SpkInspectorSubPane >> refreshFromService [

	"Must be sent in the UI thread."

	self header classMembershipDescription:
		model classMembershipDescription.
	self
		updateSelfDescription;
		refreshViews;
		updateViewMenu
]

{ #category : 'refreshing' }
SpkInspectorSubPane >> refreshTwizzledListLabel [

	viewTwizzle labelString: currentView labelString
]

{ #category : 'refreshing' }
SpkInspectorSubPane >> refreshViews [

	| oldViews |
	oldViews := views ifNil: [ #(  ) ].

	views := model views collect: [ :viewService | 
		         oldViews
			         detect: [ :existingView | 
			         existingView model == viewService ]
			         ifNone: [ self presenterForService: viewService ] ].

	self flag: 'first only works for the default'.
	(views includes: currentView) ifFalse: [ 
		self currentView: views first "Default" ].

	views do: [ :view | view refreshFromService ].
	self refreshTwizzledListLabel
]

{ #category : 'refreshing' }
SpkInspectorSubPane >> updateCoordinatesBasedOn: initialSuffix [

	| coordinateSuffix |
	coordinateSuffix := initialSuffix.
	views do: [ :view | 
		coordinateSuffix := view updateCoordinatesBasedOn: coordinateSuffix ].
	^ coordinateSuffix
]

{ #category : 'initialization' }
SpkInspectorSubPane >> updateSelfDescription [

	selfDescription
		labelString: model selfDescription;
		bodyString: model selfDescription
]

{ #category : 'refreshing' }
SpkInspectorSubPane >> updateViewMenu [

	self flag: 'Need to generate menu dynamically from views'.
	self header menu: self pane menuCommandGroup asMenuPresenter
]
