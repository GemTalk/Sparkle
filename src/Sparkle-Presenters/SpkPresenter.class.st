"
Abstract superclass for Sparkle presenters.

Provides various overrides of default Spec2 behavior to add or modify functionality.

**Instance variables** 
*	spkLayout <SpkBoxLayout> The layout for my contents. This is the same purpose as the **layout** instvar inherited from my superclass, but that is an observable slot, which caused some problems, so this is just a normal instvar.
"
Class {
	#name : 'SpkPresenter',
	#superclass : 'SpPresenter',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'layout' }
SpkPresenter class >> defaultLayout [

	"This method only here to quiet browser linting. Should never be sent to this class
	or its subclasses.
	All Sparkle layouts are created and managed on the instance side."

	self error: '#defaultLayout sent when not expected'
]

{ #category : 'work in progress' }
SpkPresenter class >> notYetImplemented: aString [

	"Use this message for actions not yet implemented. 
	Browse senders of this message to find some of the things that still need to be worked on.
	'shucks' courtesy of Mark Roder, 1994."

	self inform: aString , ' not yet implemented (shucks)'
]

{ #category : 'adding' }
SpkPresenter >> addSeparator [

	self layout add: self newSeparatorPresenter primaryDimension: 1
]

{ #category : 'accessing' }
SpkPresenter >> column [

	^ self pane column
]

{ #category : 'layout' }
SpkPresenter >> defaultLayout [

	self subclassResponsibility
]

{ #category : 'private-traversing' }
SpkPresenter >> extraPresenters [

	"Answer a collection of presenters that are logically my children but answer false 
	to isKindOf: SpAbstractPresenter. For instance, children held in a collection, rather
	than directly in slots."

	^ OrderedCollection new
]

{ #category : 'accessing' }
SpkPresenter >> iconNamed: aSymbol [
	^ self application iconNamed: aSymbol
]

{ #category : 'testing' }
SpkPresenter >> isExplorer [

	^ false
]

{ #category : 'testing' }
SpkPresenter >> isPane [

	"Pane classes answer true, others false"

	^ false
]

{ #category : 'accessing' }
SpkPresenter >> layout [

	"Cannot use the instvar 'layout' since it is defined in a superclass as an observable slot."

	"^ spkLayout ifNil: [ spkLayout := self newLayout ]"
	
	^ super layout
]

{ #category : 'widgets' }
SpkPresenter >> newButton [

	^ self instantiate: SpkButtonPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newIconButton [

	^ self instantiate: SpkIconButtonPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newLabel [

	^ self instantiate: SpkLabelPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newMenuButton [

	^ self instantiate: SpkMenuButtonPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newSeparatorMorph [

	^ Morph new
		  color: Color veryDarkGray;
		  height: 2;
		  vResizing: #rigid;
		  "Should be layout's primary direction, not vertical"yourself
]

{ #category : 'adding' }
SpkPresenter >> newSeparatorPresenter [

	^ self newMorph
		  morph: self newSeparatorMorph;
		  yourself
]

{ #category : 'widgets' }
SpkPresenter >> newSplitter [

	^ self instantiate: SpkSplitterPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newTable [

	^ self instantiate: SpkMultipleSelectionTablePresenter
]

{ #category : 'accessing' }
SpkPresenter >> nonChildSlotNames [

	"Answer a collection of the names of slots that, though they might 
	refer to presenters, those presenters are not my children."

	^ #( #owner )
]

{ #category : 'work in progress' }
SpkPresenter >> notYetImplemented: aString [

	self class notYetImplemented: aString
]

{ #category : 'accessing' }
SpkPresenter >> pane [

	^ self isPane
		  ifTrue: [ self ]
		  ifFalse: [ owner pane ]
]

{ #category : 'private' }
SpkPresenter >> presenterForService: aPaneService [

	"Create and answer the appropriate type of presenter for this pane service"

	| matches presenterClass |
	matches := self application presenterClassesForServiceTypes 
		           associationsSelect: [ :a | aPaneService isKindOf: a key ].
	matches size = 1 ifFalse: [ 
		self error: 'Pane service is of unknown or multiple type' ].
	presenterClass := matches values first.
	^ presenterClass owner: self on: aPaneService
]

{ #category : 'private-traversing' }
SpkPresenter >> presentersDo: aBlock [

	self class allSlots
		reject: [ :each | self nonChildSlotNames includes: each name ]
		thenDo: [ :each | 
			| var |
			var := self readSlot: each.
			(var isKindOf: SpAbstractPresenter) ifTrue: [ aBlock value: var ] ].
	self extraPresenters do: aBlock
]

{ #category : 'private' }
SpkPresenter >> splitterConstraints [

	^ [ :c | c size: self splitterSize ]
]

{ #category : 'private' }
SpkPresenter >> splitterSize [

	^ SpkSplitterMorph splitterWidth
]
