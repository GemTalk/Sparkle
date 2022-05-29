Class {
	#name : 'SpkLinkedFromPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'pane',
		'unlinkButton',
		'label'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkLinkedFromPresenter >> color: aColor [

	self layout color: aColor
]

{ #category : 'layout' }
SpkLinkedFromPresenter >> constraintsBlock [

	^ [ :c | c height: 24 ]
]

{ #category : 'layout' }
SpkLinkedFromPresenter >> defaultLayout [

	^ SpkBoxLayout newHorizontal
]

{ #category : 'initialization' }
SpkLinkedFromPresenter >> initializePresenters [

	unlinkButton := self newIconButton
		                icon: (self iconNamed: #unlinkPane16);
		                action: [ owner halt ];
		                help: 'Make pane independent';
		                yourself.

	label := self newLabel.


	self layout
		add: unlinkButton withConstraints: [ :c | c width: 16 ];
		add: label
]

{ #category : 'accessing' }
SpkLinkedFromPresenter >> label: aString [

	label label: aString
]
