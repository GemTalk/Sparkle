Class {
	#name : 'SpkWindow',
	#superclass : 'SpWindow',
	#instVars : [
		'hamburgerMenu'
	],
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'hacking' }
SpkWindow >> addMenuControl [
	"If I have a label area, add a menu control to it."

	labelArea ifNil: [^ self]. "No menu if no label area"
	hamburgerMenu ifNotNil: [ hamburgerMenu delete ].
	labelArea addMorphBack: (hamburgerMenu := self createHamburgerMenu).
	^super addMenuControl
]

{ #category : 'hacking' }
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
		addUpAction: [self offerWindowMenu];
		setBalloonText: 'hamburger menu' translated;
		extent: self boxExtent.
	^msb
]

{ #category : 'hacking' }
SpkWindow >> iconNamed: aSymbol [

	^self model iconNamed: aSymbol
]
