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
	
	self presenter whenIconChangedDo: [ self updateIcon ].
	
	button bindKeyCombination: Character space toAction: [ self action ].

	^ button
]

{ #category : 'accessing' }
SpMorphicSpkIconButtonAdapter >> icon: aForm [

	self widgetDo: [ :w | w labelGraphic: aForm ]
]

{ #category : 'factory' }
SpMorphicSpkIconButtonAdapter >> newButton [

	^ SpkIconicButtonMorph new
		  target: self;
		  actionSelector: #action;
		  yourself
]

{ #category : 'updating' }
SpMorphicSpkIconButtonAdapter >> updateIcon [

	self widgetDo: [ :w | w labelGraphic: self presenter icon ]
]
