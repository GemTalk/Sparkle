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
	#superclass : 'SpkPresenterWithinPane',
	#instVars : [
		'twizzle',
		'label',
		'labelString',
		'topLayout',
		'subLayout',
		'subLayoutIsShown'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkTwizzledPresenter >> initializeLabel [

	label := self newLabel
		               label: ''
		               yourself.
	topLayout add: label withConstraints: [ :c | c fill: false ]
]

{ #category : 'initialization' }
SpkTwizzledPresenter >> initializePresenters [

	super initializePresenters.
	self initializeTop
]

{ #category : 'initialization' }
SpkTwizzledPresenter >> initializeTop [

	topLayout := SpkBoxLayout newHorizontal.
	self layout add: topLayout withConstraints: [ :c | c height: 25 ].
	self
		initializeTwizzle;
		initializeLabel
]

{ #category : 'accessing' }
SpkTwizzledPresenter >> initializeTwizzle [

	subLayoutIsShown := false. "Don't want to set this true until there is a sublayout."
	twizzle := self newIconButton
		           icon: self twizzleIcon;
		           help: 'Show or hide the full exception description';
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

{ #category : 'accessing' }
SpkTwizzledPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'as yet unclassified' }
SpkTwizzledPresenter >> showSubLayout: aBoolean [

	subLayoutIsShown := aBoolean.
	self updateSubLayoutVisibility
]

{ #category : 'accessing' }
SpkTwizzledPresenter >> subLayout: anObject [

	subLayout := anObject
]

{ #category : 'operations' }
SpkTwizzledPresenter >> toggle [

	subLayoutIsShown  := subLayoutIsShown not.
	self
		updateTwizzleIcon;
		updateSubLayoutVisibility
]

{ #category : 'initialization' }
SpkTwizzledPresenter >> twizzleIcon [

	^ subLayoutIsShown
		  ifTrue: [ self iconNamed: #treeExpanded ]
		  ifFalse: [ self iconNamed: #treeUnexpanded ]
]

{ #category : 'updating' }
SpkTwizzledPresenter >> updateLabel [

	label label: labelString
]

{ #category : 'operations' }
SpkTwizzledPresenter >> updateSubLayoutVisibility [

	"We don't always know whether it is already shown."

	subLayoutIsShown
		ifTrue: [ 
			(self layout includesPresenter: subLayout) ifFalse: [ 
				self layout add: subLayout after: topLayout ] ]
		ifFalse: [ self layout remove: subLayout ifAbsent: [  ] ]
]

{ #category : 'actions' }
SpkTwizzledPresenter >> updateTwizzleIcon [

	twizzle icon: self twizzleIcon
]
