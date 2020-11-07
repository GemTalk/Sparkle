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
		'fieldListIsShown',
		'fields'
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

	self initializeFields.
	fieldList := self newTable.
	fieldList
		items: fields;
		addColumn: (SpStringTableColumn evaluated: #name);
		addColumn: (SpStringTableColumn evaluated: #description);
		addColumn: ((SpImageTableColumn evaluated: [ :field | 
					  field isOpen
						  ifTrue: [ self iconNamed: #hamburgerWhite16 ]
						  ifFalse: [ self iconNamed: #glamorousSpawn ] ])
				 width: 25;
				 yourself);
		hideColumnHeaders
]

{ #category : 'initialization' }
SpkInspectorPaneBody >> initializeFields [

	fields := OrderedCollection new.
	model fieldNames
		with: model fieldDescriptions
		do: [ :fname :fdesc | 
			| field |
			field := SpkInspectorField new
				         name: fname;
				         description: fdesc;
				         yourself.
			fields add: field ]
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
