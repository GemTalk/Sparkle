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

{ #category : 'testing' }
SpkHeader >> canUnlink [

	"Am I a header for a pane that can be unlinked to become an independent pane?"

	^ self pane canUnlink
]

{ #category : 'accessing' }
SpkHeader >> closeButton [
	^ closeButton
]

{ #category : 'accessing' }
SpkHeader >> closeButton: anObject [
	closeButton := anObject
]

{ #category : 'accessing' }
SpkHeader >> closeButtonHelp [

	self subclassResponsibility
]

{ #category : 'private' }
SpkHeader >> closeButtonWidth [

	^ 24
]

{ #category : 'layout' }
SpkHeader >> constraintsBlock [

	^ [ :c | ]
]

{ #category : 'layout' }
SpkHeader >> defaultLayout [

	^ SpkBoxLayout newHorizontal
]

{ #category : 'accessing colors' }
SpkHeader >> headerColor [

	"Non-pane headers are usually transparent"

	^ Color transparent
]

{ #category : 'accessing colors' }
SpkHeader >> headerHeight [

	^ 30
]

{ #category : 'initialization' }
SpkHeader >> initializePresenters [

	super initializePresenters.
	menuButton := self newMenuButton
		              icon: (self iconNamed: #hamburgerWhite16);
		              help: self menuHelp;
		              yourself.
	closeButton := self newIconButton
		               icon: (self iconNamed: #glamorousClose);
		               help: self closeButtonHelp;
		               action: [ owner closeRequestedLocally ];
		               yourself.
	labelLayout := SpkBoxLayout newHorizontal
		               placeWidgetsJustified;
		               vAlignWidgetsAtCenter;
		               hAlignWidgetsAtLeft;
		               yourself
]

{ #category : 'accessing' }
SpkHeader >> labelString [

	^ 'This is a non-label'
]

{ #category : 'accessing' }
SpkHeader >> menu [

	^ menu
]

{ #category : 'accessing' }
SpkHeader >> menu: anObject [

	menu := anObject.
	menuButton menu: menu
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
SpkHeader >> menuHelp [

	"Override to answer a string"

	^ nil
]

{ #category : 'accessing' }
SpkHeader >> pane [

	^ owner pane
]
