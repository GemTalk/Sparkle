"
A presenter, part of a pane, with a twizzle and a lable in the header, and a sub-layout below it, whose visibility is controlled by the twizzle.

To use,
* Instantiate in a pane.
* Send #pane: to let me know who my pane is.
* Send subLayout: with a layout to be hidden or shown.
* Send showSubLayout: with a boolean argument to set the initial visibility of the sublayout.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	label:		<SpkLabelPresenter>
	labelString: <String> The string to display in the label
	pane:		<SpkPane> The pane to which I belong
	subLayout:		<SpkBoxLayout> The layout which is hidden or shown by the action of the twizzle
	subLayoutIsShown:		<Boolean> The current state of the twizzle
	topLayout: 		<SpkBoxLayout> The layout containing the twizzle and the label
	twizzle:		<SpkIconButtonPresenter> The twizzle widget


    Implementation Points
"
Class {
	#name : 'SpkTwizzledPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'twizzle',
		'label',
		'labelString',
		'ownerLayout',
		'topLayout',
		'subPresenter',
		'subPresenterIsShown'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'layout' }
SpkTwizzledPresenter >> defaultLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'private' }
SpkTwizzledPresenter >> hideSubPresenter [

	subPresenter ifNil: [ ^ self ].
	ownerLayout remove: subPresenter ifAbsent: [  ]
]

{ #category : 'initialization' }
SpkTwizzledPresenter >> initializeLabel [

	label := self newLabel
		         label: '';
		         yourself.
	topLayout add: label withConstraints: [ :c | c fill: false ]
]

{ #category : 'initialization' }
SpkTwizzledPresenter >> initializePresenters [

	super initializePresenters.
	ownerLayout := owner layout.
	self initializeTop
]

{ #category : 'initialization' }
SpkTwizzledPresenter >> initializeTop [

	topLayout := SpkBoxLayout newHorizontal
		hAlignWidgetsAtLeft;
		yourself.
	ownerLayout add: topLayout withConstraints: [ :c | c height: 25 ].
	self
		initializeTwizzle;
		initializeLabel
]

{ #category : 'accessing' }
SpkTwizzledPresenter >> initializeTwizzle [

	subPresenterIsShown := false. "Don't want to set this true until there is a subpresenter."
	twizzle := self newIconButton
		           icon: self twizzleIcon;
		           action: [ self toggle ];
		           yourself.
	topLayout add: twizzle withConstraints: [ :c | 
		c
			fill: false;
			width: 25;
			height: 25 ]
]

{ #category : 'accessing' }
SpkTwizzledPresenter >> labelString: aString [

	labelString := aString.
	self updateLabel
]

{ #category : 'private' }
SpkTwizzledPresenter >> showSubPresenter [

	subPresenter ifNil: [ ^ self ].
	(ownerLayout includesPresenter: subPresenter) ifFalse: [ 
		ownerLayout
			add: subPresenter
			after: topLayout
			withConstraints: [ :c | c fill: true ] ]
]

{ #category : 'as yet unclassified' }
SpkTwizzledPresenter >> showSubPresenter: aBoolean [

	subPresenterIsShown := aBoolean.
	self
		updateTwizzleIcon;
		updateSubPresenterVisibility
]

{ #category : 'accessing' }
SpkTwizzledPresenter >> subPresenter: anObject [

	"Remove any old subPresenter from ownerLayout"

	self hideSubPresenter.
	subPresenter := anObject.
	self updateSubPresenterVisibility
]

{ #category : 'actions' }
SpkTwizzledPresenter >> toggle [

	subPresenterIsShown  := subPresenterIsShown not.
	self
		updateTwizzleIcon;
		updateSubPresenterVisibility
]

{ #category : 'accessing' }
SpkTwizzledPresenter >> twizzleHelp: aString [

	twizzle help: aString
]

{ #category : 'initialization' }
SpkTwizzledPresenter >> twizzleIcon [

	^ subPresenterIsShown
		  ifTrue: [ self iconNamed: #twizzleExpanded24 ]
		  ifFalse: [ self iconNamed: #twizzleUnexpanded24 ]
]

{ #category : 'updating' }
SpkTwizzledPresenter >> updateLabel [

	label label: labelString
]

{ #category : 'actions' }
SpkTwizzledPresenter >> updateSubPresenterVisibility [

	"We don't always know whether it is already shown.
	Also we may initially have a nil subPresenter."

	subPresenterIsShown
		ifTrue: [ self showSubPresenter ]
		ifFalse: [ self hideSubPresenter ]
]

{ #category : 'actions' }
SpkTwizzledPresenter >> updateTwizzleIcon [

	twizzle icon: self twizzleIcon
]
