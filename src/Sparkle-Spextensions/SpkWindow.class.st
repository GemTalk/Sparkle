Class {
	#name : 'SpkWindow',
	#superclass : 'SpWindow',
	#instVars : [
		'hamburgerMenu'
	],
	#category : 'Sparkle-Spextensions-Morphic'
}

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

{ #category : 'as yet unclassified' }
SpkWindow >> lockInactivePortions [

	"Lock parts that should not respond to mouse and keyboard when I am not the top window."

	self submorphsDo: [ :m | (self shouldLock: m) ifTrue: [ m lock ] ]
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

{ #category : 'as yet unclassified' }
SpkWindow >> shouldLock: aMorph [

	"Answer true if the given submorph should not respond to mouse and keyboard when I am not the top window."

	"Title bar controls remain active"

	aMorph == labelArea ifTrue: [ ^ false ].

	"Edge and corner grips that are direct children remain active.
	Using #isKindOf: :-/ to avoid extending base classes."
	(aMorph isKindOf: AbstractResizerMorph) ifTrue: [ ^ false ].
	^ true
]
