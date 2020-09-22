Class {
	#name : 'SpkPaneHeader',
	#superclass : 'SpkHeader',
	#instVars : [
		'dragHandle'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'layout' }
SpkPaneHeader class >> defaultSpec [

	^ super defaultSpec	
		  add: #dragHandle width: 16 beforeIndex: 1;
		  yourself
]

{ #category : 'layout' }
SpkPaneHeader class >> headerLayout [

	^ SpkBoxLayout newHorizontal
		  color: self headerColor;
		  add: #paneIcon width: 16;
		  add: (SpkBoxLayout newHorizontal
				   hAlignCenter;
				   vAlignEnd;
				   add: #paneLabel withConstraints: [ :constraints | 
					   constraints
						   fill: false;
						   yourself ];
				   yourself);
		  add: #paneMenuButton width: 24;
		  add: #paneCloseButton width: 24;
		  yourself
]

{ #category : 'accessing' }
SpkPaneHeader >> dragHandle [
	^ dragHandle
]

{ #category : 'accessing' }
SpkPaneHeader >> dragHandle: anObject [
	dragHandle := anObject
]

{ #category : 'initialization' }
SpkPaneHeader >> initializePresenters [

	super initializePresenters.
	dragHandle := self newImage
		              image: (self iconNamed: #glamorousGrayCircleEmpty);
		              yourself
]
