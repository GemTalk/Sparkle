Class {
	#name : 'SpkWindow',
	#superclass : 'SpWindow',
	#instVars : [
		'hamburgerMenu'
	],
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'adding' }
SpkWindow >> addCornerGrips [
	"Should add these to the front!"
	
	|tl tr lh|
	lh := self labelHeight.
	tl  := SpkTopLeftGripMorph new target: self; position: self position.
	tl layoutFrame topOffset: lh negated.
	tr  := SpkTopRightGripMorph new target: self; position: self position.
	tr layoutFrame topOffset: lh negated.
	self
		addMorph: tl;
		addMorph: tr;
		addMorph: (SpkBottomLeftGripMorph new target: self;position: self position);
		addMorph: (SpkBottomRightGripMorph new target: self;position: self position)
]

{ #category : 'menus' }
SpkWindow >> buildHamburgerMenu [

	^self model buildHamburgerMenu
]

{ #category : 'menus' }
SpkWindow >> createHamburgerMenu [
	"Answer a button for the window menu."
	
"	^aSystemWindow createBox
		labelGraphic: (self windowMenuIconFor: aSystemWindow);
		extent: aSystemWindow boxExtent;
		actWhen: #buttonDown;
		actionSelector: #offerWindowMenu;
		setBalloonText: 'window menu' translated"
	
	|form msb|
	form := self iconNamed: #hamburgerWhite16.
	msb := MultistateButtonMorph new extent: form extent.
	msb activeEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self iconNamed: #hamburgerWhite16.
	msb extent: form extent.
	msb activeDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self iconNamed: #hamburgerWhite16.
	msb extent: form extent.
	msb
		activeEnabledOverUpFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverUpFillStyle: (ImageFillStyle form: form).
	form := self iconNamed: #hamburgerWhite16.
	msb
		extent: form extent;
		activeEnabledOverDownFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverDownFillStyle: (ImageFillStyle form: form);
		addUpAction: [self offerHamburgerMenu];
		setBalloonText: 'transaction control' translated;
		extent: self boxExtent.
	^msb
]

{ #category : 'accessing' }
SpkWindow >> iconNamed: aSymbol [

	^self model iconNamed: aSymbol
]

{ #category : 'accessing' }
SpkWindow >> model: aPresenter [

	super model: aPresenter.
	labelArea ifNil: [ ^ self ]. "No menu if no label area"
	hamburgerMenu ifNotNil: [ hamburgerMenu delete ].
	labelArea
		addMorph: (hamburgerMenu := self createHamburgerMenu)
		inFrontOf: menuBox
]

{ #category : 'menus' }
SpkWindow >> offerHamburgerMenu [

	| aMenu |
	aMenu := self buildHamburgerMenu asMenuPresenter.
	aMenu openWithSpecAtPointer
]
