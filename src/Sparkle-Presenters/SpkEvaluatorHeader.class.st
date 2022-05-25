Class {
	#name : 'SpkEvaluatorHeader',
	#superclass : 'SpkHeader',
	#instVars : [
		'label'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkEvaluatorHeader >> closeButtonHelp [

	^ 'Close the evaluator'
]

{ #category : 'layout' }
SpkEvaluatorHeader >> constraintsBlock [

	^ [ :c | c height: 30 ]
]

{ #category : 'display' }
SpkEvaluatorHeader >> displayLinkingArrow: aBoolean [

	| iconName helpString |
	aBoolean
		ifTrue: [ 
			iconName := #hidePane16.
			helpString := 'Close the evaluation''s result' ]
		ifFalse: [ 
			iconName := #glamorousClose.
			helpString := self closeButtonHelp ].
	closeButton
		icon: (self iconNamed: iconName);
		help: helpString
]

{ #category : 'accessing colors' }
SpkEvaluatorHeader >> headerColor [

	^ Color fromHexString: '2f3531'
]

{ #category : 'initialization' }
SpkEvaluatorHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label label: 'Evaluator'.


	labelLayout add: label withConstraints: [ :c | c fill: false ].

	self layout
		color: self headerColor;
		add: labelLayout;
		add: menuButton width: self menuButtonWidth;
		add: closeButton width: self closeButtonWidth
]
