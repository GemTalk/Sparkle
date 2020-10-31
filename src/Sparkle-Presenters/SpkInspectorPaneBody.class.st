Class {
	#name : 'SpkInspectorPaneBody',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'twizzle',
		'description'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

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
		           icon: (self iconNamed: #treeUnexpanded);
		           help: 'Display the field list';
		           action: [ self showFieldList ];
		           help: 'Expand the field list';
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
