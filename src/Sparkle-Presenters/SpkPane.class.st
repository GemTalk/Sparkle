"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.


**Instance Variables**
* coordinate	<SpkPaneCoordinate> Determines the position of this pane in its window, relative to other panes.
* linkedFrom		<nil or some presentation layer object> If I am linked to a parent, the object that has me as its linkedPane. Examples of objects with linked panes: InspectorField, Evaluator.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpkPresenterWithHeader',
	#traits : 'SpkTLayoutService',
	#classTraits : 'SpkTLayoutService classTrait',
	#instVars : [
		'coordinate',
		'linkedFrom'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialize-release' }
SpkPane >> close [

	self linkedPanes do: [ :each | each close ].
	model unsubscribe: self.
	"A pane's owner is the column it's in."
	owner remove: self.
	linkedFrom ifNotNil: [ linkedFrom closingLinkedPane: self ]
]

{ #category : 'events' }
SpkPane >> closeRequestedLocally [

	self close
]

{ #category : 'accessing' }
SpkPane >> coordinate [
	^ coordinate
]

{ #category : 'accessing' }
SpkPane >> coordinate: anObject [
	coordinate := anObject
]

{ #category : 'actions' }
SpkPane >> disableAll [

	"Disable all widgets in this pane so that we cannot get any GUI events while
	awaiting an answer from the server."

	self enabled: false.
	self layout enabled: false
]

{ #category : 'tests - header' }
SpkPane >> headerClass [

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkPane >> initialize [

	super initialize.
	coordinate := SpkPaneCoordinate new
]

{ #category : 'initialization' }
SpkPane >> initializeHeader [

	header := self instantiate: self headerClass on: model.
	self layout
		add: header
		withConstraints: [ :c | c height: header headerHeight ]
]

{ #category : 'accessing' }
SpkPane >> linkedFrom [

	^ linkedFrom
]

{ #category : 'accessing' }
SpkPane >> linkedFrom: anObject [

	linkedFrom := anObject
]

{ #category : 'accessing' }
SpkPane >> linkedPanes [

	^ #(  )
]

{ #category : 'accessing' }
SpkPane >> menuActions [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkPane >> newLayout [

	^ SpkAccordianLayout newVertical
]

{ #category : 'accessing' }
SpkPane >> nonChildSlotNames [

	^ super nonChildSlotNames , #( #linkedFrom )
]

{ #category : 'actions' }
SpkPane >> reEnableAll [

	"Enable widgets in this pane after receiving a reply from the server.
At the moment, this does enable all widgets in the pane.
At some point, we will need to do something more sophisticated to determine whether
an item really should be enabled."

	self enabled: true.
	self layout enabled: true
]

{ #category : 'menu messages' }
SpkPane >> redo [

	^ model redo
]

{ #category : 'initialization' }
SpkPane >> setCoordinateFromLayoutService [

	coordinate := SpkPaneCoordinate forVector:
		              self layoutService paneCoordinate
]

{ #category : 'menu messages' }
SpkPane >> undo [

	^ model undo
]
