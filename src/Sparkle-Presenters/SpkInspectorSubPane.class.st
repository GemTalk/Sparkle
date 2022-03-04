Class {
	#name : 'SpkInspectorSubPane',
	#superclass : 'SpkPresenterWithModel',
	#traits : 'SpkTHeader',
	#classTraits : 'SpkTHeader classTrait',
	#instVars : [
		'pane',
		'selfDescription',
		'viewTwizzle',
		'currentView',
		'views'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'events' }
SpkInspectorSubPane >> closeRequestedLocally [

	pane closeRequestedLocally
]

{ #category : 'accessing' }
SpkInspectorSubPane >> column [

	^ pane column
]

{ #category : 'accessing' }
SpkInspectorSubPane >> coordinate [

	^ pane coordinate
]

{ #category : 'actions' }
SpkInspectorSubPane >> copyOop [ 

	"Put the oop of the inspected object on the clipboard as a hex string 
	(the same as it's displayed in the header)"
	
	Clipboard clipboardText: model oop hex.
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

	pane disableAll
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
SpkInspectorSubPane >> initializeFieldList [

	self
		initializeSelfDescription;
		addSeparator;
		initializeTwizzledList.
	viewTwizzle twizzleHelp: 'Show or hide the field list'
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
		initializeFieldList
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

{ #category : 'accessing' }
SpkInspectorSubPane >> itemsWithLinkedPanes [

	"In addition to linked panes in the list, the inspector's 
	evaluators may also have linked panes."

	^ listModel itemsWithLinkedPanes , owner evaluatorsWithLinkedPanes
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
SpkInspectorSubPane >> pane: anInspectorPane [

	pane := anInspectorPane.
	"Cannot do the following until my pane is known."
	self header menu: pane menuCommandGroup asMenuPresenter.
	self refreshListModel.
	model
		when: SpkPaneServiceAnnouncement
		send: #receivePaneServiceAnnouncement:
		to: pane
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
SpkInspectorSubPane >> refreshTwizzledList [

	self refreshListModel.
	viewTwizzle labelString: self listLabelString
]

{ #category : 'as yet unclassified' }
SpkInspectorSubPane >> updateFieldList [

	self
		deselectChangedFields;
		refreshTwizzledList.
]

{ #category : 'initialization' }
SpkInspectorSubPane >> updateFromModel [

	"Must be sent in the UI thread."

	self header classMembershipDescription:
		model classMembershipDescription.
	self
		updateSelfDescription;
		updateFieldList
]

{ #category : 'updating' }
SpkInspectorSubPane >> updateLinkedPaneCoordinates [

	"Copy the body of the trait implementation here, since trait aliasing does not seem to work. "
	self itemsWithLinkedPanes do: [ :item | 
		item linkedPane coordinate:
			(item coordinateRelativeTo: self coordinate) ].

	"Then, update the evaluators in case the list size has changed."
	pane updateEvaluatorIndices
]

{ #category : 'initialization' }
SpkInspectorSubPane >> updateSelfDescription [

	selfDescription
		labelString: model selfDescription;
		bodyString: model selfDescription
]
