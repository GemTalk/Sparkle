Class {
	#name : 'SpkInspectorPaneBody',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'twizzle',
		'description',
		'fieldList',
		'fieldListIsShown'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkInspectorPaneBody >> initialize [

	"Super initialize accesses fieldListIsShown, so initialize it first."

	fieldListIsShown := false.
	super initialize
]

{ #category : 'initialization' }
SpkInspectorPaneBody >> initializeDescription [

	description := self newLabel
		               label: model selfDescription;
		               yourself.
	self layout add: description withConstraints: [ :c | c fill: false ]
]

{ #category : 'initialization' }
SpkInspectorPaneBody >> initializePresenters [

	"Start with the field list closed, so no list yet"

	super initializePresenters.
	self
		initializeTwizzle;
		initializeDescription
]

{ #category : 'initialization' }
SpkInspectorPaneBody >> initializeTwizzle [

	twizzle := self newIconButton
		           icon: self twizzleIcon;
		           help: 'Show or hide the field list';
		           action: [ self toggleFieldList ];
		           yourself.
	self layout add: twizzle withConstraints: [ :c | 
		c
			fill: false;
			width: 20;
			height: 20 ]
]

{ #category : 'accessing' }
SpkInspectorPaneBody >> newLayout [

	^ SpkBoxLayout newHorizontal
]

{ #category : 'actions' }
SpkInspectorPaneBody >> toggleFieldList [

	fieldListIsShown := fieldListIsShown not.
	self
		updateTwizzleIcon;
		updateFieldListVisibility
]

{ #category : 'private' }
SpkInspectorPaneBody >> twizzleIcon [

	^ fieldListIsShown
		  ifTrue: [ self iconNamed: #treeExpanded ]
		  ifFalse: [ self iconNamed: #treeUnexpanded ]
]

{ #category : 'actions' }
SpkInspectorPaneBody >> updateFieldListVisibility [

	self flag: 'Need to actually do something here.'
]

{ #category : 'actions' }
SpkInspectorPaneBody >> updateTwizzleIcon [

	twizzle icon: self twizzleIcon
]
