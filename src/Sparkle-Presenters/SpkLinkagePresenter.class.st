"
Appended to a pane header, shows what a linked pane is linked from.
"
Class {
	#name : 'SpkLinkagePresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'linkageIcon',
		'unlinkButton',
		'label'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkLinkagePresenter >> color: aColor [

	self layout color: aColor
]

{ #category : 'layout' }
SpkLinkagePresenter >> constraintsBlock [

	^ [ :c | c height: 24 ]
]

{ #category : 'layout' }
SpkLinkagePresenter >> defaultLayout [

	^ SpkBoxLayout newHorizontal
		  hAlignWidgetsAtLeft;
		  yourself
]

{ #category : 'initialization' }
SpkLinkagePresenter >> initializePresenters [

	linkageIcon := self newImage
						image: (self iconNamed: #linkedFrom16);
						yourself.

	unlinkButton := self newIconButton
		                icon: (self iconNamed: #unlinkPane16);
		                action: [ owner halt ];
		                help: 'Make pane independent';
		                yourself.

	label := self newLabel.


	self layout
		add: linkageIcon width: 18;
		add: unlinkButton width: 20;
		add: label
]

{ #category : 'accessing' }
SpkLinkagePresenter >> label: aString [

	label label: aString
]
