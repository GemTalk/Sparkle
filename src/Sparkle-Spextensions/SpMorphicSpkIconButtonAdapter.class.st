Class {
	#name : 'SpMorphicSpkIconButtonAdapter',
	#superclass : 'SpMorphicSpkButtonAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkIconButtonAdapter >> buildWidget [

	| button |
	button := self newButton.
	button
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		setBalloonText: self getHelpText;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;
		color: Color transparent;
		borderWidth: 0;
		labelGraphic: self presenter icon.


	self color ifNotNil: [ :c | button color: c ].

	button bindKeyCombination: Character space toAction: [ self action ].

	^ button
]

{ #category : 'accessing' }
SpMorphicSpkIconButtonAdapter >> icon: aForm [

	widget ifNotNil: [ :w | w labelGraphic: aForm ]
]

{ #category : 'factory' }
SpMorphicSpkIconButtonAdapter >> newButton [

	^ IconicButton new
		  target: self;
		  actionSelector: #action;
		  yourself
]
