Class {
	#name : 'SpkHeader',
	#superclass : 'SpkPresenter',
	#instVars : [
		'closeButton',
		'label',
		'menu',
		'menuButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'specs' }
SpkHeader class >> defaultSpec [

	^ SpkBoxLayout newHorizontal
		  color: self headerColor;
		  add: (SpkBoxLayout newHorizontal
				   hAlignCenter;
				   vAlignEnd;
				   add: #label withConstraints: [ :constraints | 
					   constraints
						   fill: false;
						   yourself ];
				   yourself);
		  add: #menuButton width: 24;
		  add: #closeButton width: 24;
		  yourself
]

{ #category : 'accessing colors' }
SpkHeader class >> headerColor [

	"Non-pane headers are usually transparent"

	^ Color transparent
]

{ #category : 'accessing' }
SpkHeader >> closeButton [
	^ closeButton
]

{ #category : 'accessing' }
SpkHeader >> closeButton: anObject [
	closeButton := anObject
]

{ #category : 'initialization' }
SpkHeader >> connectPresenters [

	super connectPresenters.
	menuButton menu: self menu
]

{ #category : 'initialization' }
SpkHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label label: containingPresenter label.
	menuButton := self newMenuButton
		              color: Color transparent;
		              icon: (self iconNamed: #hamburgerWhite16);
		              yourself.
	closeButton := self newButton
		               color: Color transparent;
		               icon: (self iconNamed: #glamorousClose);
		               help: 'Close the pane';
		               action: [ containingPresenter closeRequestedLocally ];
		               yourself
]

{ #category : 'accessing' }
SpkHeader >> label [
	^ label
]

{ #category : 'accessing' }
SpkHeader >> label: anObject [
	label := anObject
]

{ #category : 'accessing' }
SpkHeader >> menu [

	^ menu ifNil: [ 
		  menu := containingPresenter menuActions asMenuPresenter ]
]

{ #category : 'accessing' }
SpkHeader >> menu: anObject [
	menu := anObject
]

{ #category : 'accessing' }
SpkHeader >> menuButton [
	^ menuButton
]

{ #category : 'accessing' }
SpkHeader >> menuButton: anObject [
	menuButton := anObject
]
