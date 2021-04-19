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
