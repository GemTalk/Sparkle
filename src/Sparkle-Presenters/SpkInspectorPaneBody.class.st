"
Part of an inspector pane, the top line with the printString of the object and the twizzle that hides or shows the field list, and the field list itself.

    Instance Variables
	description:		<String> printString of the object, or at least the first <largeNumber> of characters of that string.
	fieldList:		<SpkINspectorFieldList>
	fieldListIsShown:		<Boolean>
	twizzle:		<SpkIconButton> Used to hide or show the field list


    Implementation Points
"
Class {
	#name : 'SpkInspectorPaneBody',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'topLayout',
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
	topLayout add: description withConstraints: [ :c | c fill: false ]
]

{ #category : 'initialization' }
SpkInspectorPaneBody >> initializeFieldList [

	"Dynamically added to or removed from my layout upon twizzle click."

	fieldList := self newTable.
	fieldList
		addColumn: (SpStringTableColumn evaluated: #boogaloo);
		hideColumnHeaders
]

{ #category : 'initialization' }
SpkInspectorPaneBody >> initializePresenters [

	"Start with the field list closed, so no list yet"

	super initializePresenters.
	self
		initializeTop;
		initializeFieldList
]

{ #category : 'initialization' }
SpkInspectorPaneBody >> initializeTop [

	topLayout := SpkBoxLayout newHorizontal.
	self layout add: topLayout withConstraints: [ :c | c height: 25 ].
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
	topLayout add: twizzle withConstraints: [ :c | 
		c
			fill: false;
			width: 20;
			height: 20 ]
]

{ #category : 'accessing' }
SpkInspectorPaneBody >> newLayout [

	^ SpkBoxLayout newVertical
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

	fieldListIsShown
		ifTrue: [ self layout add: fieldList beforeIndex: 2 ]
		ifFalse: [ self layout remove: fieldList ]
]

{ #category : 'actions' }
SpkInspectorPaneBody >> updateTwizzleIcon [

	twizzle icon: self twizzleIcon
]
