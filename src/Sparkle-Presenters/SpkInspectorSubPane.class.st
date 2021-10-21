Class {
	#name : 'SpkInspectorSubPane',
	#superclass : 'SpkPresenterWithModel',
	#traits : 'SpkTHeader + (SpkTTwizzledList @ {#updateLinkedPaneCoordinates->#tUpdateLinkedPaneCoordinates})',
	#classTraits : 'SpkTHeader classTrait + SpkTTwizzledList classTrait',
	#instVars : [
		'pane',
		'selfDescription'
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
	twizzledList twizzleHelp: 'Show or hide the field list'
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

{ #category : 'actions' }
SpkInspectorSubPane >> itemSelected: anAnnouncement [

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

{ #category : 'accessing' }
SpkInspectorSubPane >> itemsWithLinkedPanes [

	"In addition to linked panes in the list, the inspector's 
	evaluators may also have linked panes."

	^ super itemsWithLinkedPanes , owner evaluatorsWithLinkedPanes
]

{ #category : 'accessing' }
SpkInspectorSubPane >> linkedPanes [

	^ super linkedPanes , self panesLinkedToEvaluators
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
	model
		when: SpkPaneServiceAnnouncement
		send: #receiveLinkedPaneAnnouncement:
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

	"Update the list."
	self halt.
	self tUpdateLinkedPaneCoordinates.
	"Then, update the evaluators in case the list size has changed."
	pane updateEvaluatorIndices
]

{ #category : 'initialization' }
SpkInspectorSubPane >> updateSelfDescription [

	selfDescription
		labelString: model selfDescription;
		bodyString: model selfDescription
]
