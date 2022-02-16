"
SpkBoxLayout is somewhat similar to SpBoxLayout, but has additional capabilities. Also a limitation: it currently only works with a Morphic backend, uses some Sparkle-specific Morphic extensions, and currently mostly ignores what backend has been specified.

The additional capabilities:
- Color defaults to transparent but if set to another color rovides background color for all contained presenters (if they are transparent). Partial transparency probably works.
- Justified alignment is available in the primary direction
- Secondary-direction alignment actually works for presenters that do not by their nature fill the space.
"
Class {
	#name : 'SpkBoxLayout',
	#superclass : 'SpDirectionableLayout',
	#instVars : [
		'placementRule',
		'widgetAlignment',
		'color',
		'borderWidth'
	],
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'private' }
SpkBoxLayout >> adapterName [
	^ #SpkBoxAdapter
]

{ #category : 'adding' }
SpkBoxLayout >> add: aPresenter [

	self add: aPresenter withConstraints: [ :constraints |  ]
]

{ #category : 'adding' }
SpkBoxLayout >> add: newPresenter after: anExistingPresenter [

	self
		add: newPresenter
		after: anExistingPresenter
		withConstraints: [ :c |  ]
]

{ #category : 'adding' }
SpkBoxLayout >> add: newPresenter after: anExistingPresenter withConstraints: aBlock [

	self
		add: newPresenter
		beforeIndex: (self indexOfPresenter: anExistingPresenter) + 1
		withConstraints: aBlock
]

{ #category : 'adding' }
SpkBoxLayout >> add: newPresenter before: anExistingPresenter [

	self
		add: newPresenter
		beforeIndex: (self indexOfPresenter: anExistingPresenter)
]

{ #category : 'adding' }
SpkBoxLayout >> add: newPresenter before: anExistingPresenter withConstraints: aBlock [

	self
		add: newPresenter
		beforeIndex: (self indexOfPresenter: anExistingPresenter)
		withConstraints: aBlock
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> add: aNameOrPresenter beforeIndex: anInteger [

	self
		add: aNameOrPresenter
		beforeIndex: anInteger
		withConstraints: [ :c |  ]
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> add: aNameOrPresenter beforeIndex: anInteger withConstraints: aBlock [

	| constraints |
	constraints := self constraintsClass new.
	aBlock value: constraints.
	children add: aNameOrPresenter -> constraints beforeIndex: anInteger.
	self announceChildAdded: aNameOrPresenter beforeIndex: anInteger
]

{ #category : 'adding' }
SpkBoxLayout >> add: aPresenter height: anInteger [

	self
		add: aPresenter
		withConstraints: [ :constraints | constraints height: anInteger ]
]

{ #category : 'adding' }
SpkBoxLayout >> add: aPresenter primaryDimension: anInteger [

	self isHorizontal
		ifTrue: [ self add: aPresenter width: anInteger ]
		ifFalse: [ self add: aPresenter height: anInteger ]
]

{ #category : 'adding' }
SpkBoxLayout >> add: aPresenter width: anInteger [

	self
		add: aPresenter
		withConstraints: [ :constraints | constraints width: anInteger ]
]

{ #category : 'adding' }
SpkBoxLayout >> add: aPresenter withConstraints: constraintsBlock [

	self
		add: aPresenter
		beforeIndex: children size + 1
		withConstraints: constraintsBlock
]

{ #category : 'adding' }
SpkBoxLayout >> addLast: aPresenterOrName withConstraints: aBlock [

	"#addLast: and friends have no meaning in this layout. Use #add: variants instead."

	self shouldNotImplement
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> announceChildAdded: aNameOrPresenter beforeIndex: anInteger [
	self presenter ifNotNil: [ 
		self announcer announce: (SpkChildAdded new
				 child: aNameOrPresenter;
				 index: anInteger;
				 yourself) ]
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> announceChildRemoved: aNameOrPresenter atIndex: anInteger [
	self presenter ifNotNil: [ 
		self announcer announce: (SpkChildRemoved new
				 child: aNameOrPresenter;
				 index: anInteger;
				 yourself) ]
]

{ #category : 'initialization' }
SpkBoxLayout >> beHorizontal [

	direction := SpkHorizontalLayoutDirection uniqueInstance
]

{ #category : 'initialization' }
SpkBoxLayout >> beLeftToRight [

	self beHorizontal
	
]

{ #category : 'initialization' }
SpkBoxLayout >> beTopToBottom [

	self beVertical
]

{ #category : 'initialization' }
SpkBoxLayout >> beVertical [

	direction := SpkVerticalLayoutDirection uniqueInstance
]

{ #category : 'accessing' }
SpkBoxLayout >> borderWidth [
	"Answer the border width defined for the layout (default is zero)"

	^ borderWidth
]

{ #category : 'accessing' }
SpkBoxLayout >> borderWidth: aNumber [
	"Set the border width to be used by the layout"

	borderWidth := aNumber.
	self withAdapterDo: [ :anAdapter | anAdapter updateBorderWidth ]
]

{ #category : 'accessing' }
SpkBoxLayout >> color [

	^ color ifNil: [ color := Color transparent ]
]

{ #category : 'accessing' }
SpkBoxLayout >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
SpkBoxLayout >> constraintsClass [

	^ SpkBoxConstraints
]

{ #category : 'accessing' }
SpkBoxLayout >> direction [

	^ direction
]

{ #category : 'widget alignment' }
SpkBoxLayout >> hAlignWidgetsAtCenter [

	widgetAlignment := widgetAlignment hAlignWidgetsAtCenter
]

{ #category : 'widget alignment' }
SpkBoxLayout >> hAlignWidgetsAtLeft [

	widgetAlignment := widgetAlignment hAlignWidgetsAtLeft
]

{ #category : 'widget alignment' }
SpkBoxLayout >> hAlignWidgetsAtRight [

	widgetAlignment := widgetAlignment hAlignWidgetsAtRight
]

{ #category : 'testing' }
SpkBoxLayout >> includesPresenter: aPresenter [

	^ children includesKey: aPresenter
]

{ #category : 'adding' }
SpkBoxLayout >> indexOfPresenter: anExistingPresenter [

	^ children
		  identityIndexOfKey: anExistingPresenter
		  ifAbsent: [ self error: 'Presenter not found' ]
]

{ #category : 'initialization' }
SpkBoxLayout >> initialize [

	super initialize.
	self borderWidth: 0.
	color := Color transparent.
	children := SpkOrderedDictionary new.
	placementRule := #start.
	widgetAlignment := SpkLayoutWidgetAlignmentFactory default
]

{ #category : 'testing' }
SpkBoxLayout >> isHorizontal [ 
	"Answer true if the layout direction is horizontal"

	^ direction = SpkHorizontalLayoutDirection uniqueInstance
]

{ #category : 'initialization' }
SpkBoxLayout >> isVertical [ 
	"Answer true if the layout direction is vertical"

	^ self direction = SpkVerticalLayoutDirection uniqueInstance
]

{ #category : 'placement rules' }
SpkBoxLayout >> placeWidgetsAtCenter [

	placementRule := #center
]

{ #category : 'placement rules' }
SpkBoxLayout >> placeWidgetsAtEnd [

	placementRule := #end
]

{ #category : 'placement rules' }
SpkBoxLayout >> placeWidgetsAtStart [

	placementRule := #start
]

{ #category : 'placement rules' }
SpkBoxLayout >> placeWidgetsJustified [

	placementRule := #justified
]

{ #category : 'accessing' }
SpkBoxLayout >> placementRule [

	^ placementRule
]

{ #category : 'removing' }
SpkBoxLayout >> remove: aPresenter [

	self
		remove: aPresenter
		ifAbsent: [ self error: 'Presenter not found' ]
]

{ #category : 'removing' }
SpkBoxLayout >> remove: aPresenter ifAbsent: aBlock [

	| index |
	index := children
		         identityIndexOfKey: aPresenter
		         ifAbsent: [ ^ aBlock value ].
	self removePresenterAtIndex: index
]

{ #category : 'removing' }
SpkBoxLayout >> removeAll [

	children removeAll.
	self withAdapterDo: [ :anAdapter | anAdapter removeAll ]
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> removePresenterAtIndex: anInteger [
	| association |
	association := children removeAtIndex: anInteger.
	self announceChildRemoved: association key atIndex: anInteger
]

{ #category : 'widget alignment' }
SpkBoxLayout >> vAlignWidgetsAtBottom [

	widgetAlignment := widgetAlignment vAlignWidgetsAtBottom
]

{ #category : 'widget alignment' }
SpkBoxLayout >> vAlignWidgetsAtCenter [

	widgetAlignment := widgetAlignment vAlignWidgetsAtCenter
]

{ #category : 'widget alignment' }
SpkBoxLayout >> vAlignWidgetsAtTop [

	widgetAlignment := widgetAlignment vAlignWidgetsAtTop
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> whenChildrenAddedDo: aBlock [
	"It's really *one* child that has been added, sigh."

	self announcer when: SpkChildAdded do: aBlock
]

{ #category : 'adding/removing presenters' }
SpkBoxLayout >> whenChildrenRemovedDo: aBlock [
	"It's really *one* child that has been removed, sigh."

	self announcer when: SpkChildRemoved do: aBlock
]

{ #category : 'accessing' }
SpkBoxLayout >> widgetAlignment [

	^ widgetAlignment
]
