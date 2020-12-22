Class {
	#name : 'SpkPaneHeader',
	#superclass : 'SpkHeader',
	#instVars : [
		'dragHandle'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'layout' }
SpkPaneHeader class >> oldDefaultSpec [

	^ super defaultSpec
		  add: #dragHandle
		  withConstraints: [ :constraints | constraints width: 16 ]
		  beforeIndex: 1;
		  yourself
]

{ #category : 'accessing' }
SpkPaneHeader >> closeButtonHelp [

	^ 'Close the pane'
]

{ #category : 'accessing' }
SpkPaneHeader >> dragHandle [
	^ dragHandle
]

{ #category : 'accessing' }
SpkPaneHeader >> dragHandle: anObject [
	dragHandle := anObject
]

{ #category : 'private' }
SpkPaneHeader >> dragHandleWidth [

	^ 16
]

{ #category : 'initialization' }
SpkPaneHeader >> initializePresenters [

	super initializePresenters.
	dragHandle := self newImage
		              image: (self iconNamed: #glamorousGrayCircleEmpty);
		              yourself
]
