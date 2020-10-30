Class {
	#name : 'SpkHeader',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'closeButton',
		'menu',
		'menuButton',
		'labelLayout'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'specs' }
SpkHeader class >> oldDfaultSpec [

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

{ #category : 'accessing' }
SpkHeader >> closeButton [
	^ closeButton
]

{ #category : 'accessing' }
SpkHeader >> closeButton: anObject [
	closeButton := anObject
]

{ #category : 'private' }
SpkHeader >> closeButtonWidth [

	^ 24
]

{ #category : 'initialization' }
SpkHeader >> connectPresenters [

	super connectPresenters.
	menuButton menu: self menu
]

{ #category : 'accessing colors' }
SpkHeader >> headerColor [

	"Non-pane headers are usually transparent"

	^ Color transparent
]

{ #category : 'initialization' }
SpkHeader >> initializePresenters [

	super initializePresenters.
	menuButton := self newMenuButton
		              color: Color transparent;
		              icon: (self iconNamed: #hamburgerWhite16);
		              yourself.
	closeButton := self newButton
		               color: Color transparent;
		               icon: (self iconNamed: #glamorousClose);
		               help: 'Close the pane';
		               action: [ owner closeRequestedLocally ];
		               yourself.
	labelLayout := SpkBoxLayout newHorizontal
		               hAlignJustified;
		               vAlignEnd;
		               yourself
]

{ #category : 'accessing' }
SpkHeader >> labelString [

	^ 'This is a non-label'
]

{ #category : 'accessing' }
SpkHeader >> menu [

	^ menu ifNil: [ menu := owner menuActions asMenuPresenter ]
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

{ #category : 'private' }
SpkHeader >> menuButtonWidth [

	^ 24
]

{ #category : 'accessing' }
SpkHeader >> newLayout [

	^ SpkBoxLayout newHorizontal
]
