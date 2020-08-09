"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I class take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpkPresenter',
	#instVars : [
		'paneIcon',
		'paneLabel',
		'paneMenu'
	],
	#category : 'Sparkle-Presenters'
}

{ #category : 'specs' }
SpkPane class >> defaultSpec [
	^ SpBoxLayout newVertical
		  add: self headerLayout height: self headerHeight;
		  yourself
]

{ #category : 'accessing colors' }
SpkPane class >> headerColor [
	self subclassResponsibility
]

{ #category : 'values' }
SpkPane class >> headerHeight [

	^ 30
]

{ #category : 'layout' }
SpkPane class >> headerLayout [

	^ SpkBoxLayout newHorizontal
		  color: self headerColor;
		  add: #paneIcon width: 24;
		  add: (SpkBoxLayout newHorizontal
				   hAlignCenter;
				   vAlignEnd;
				   add: #paneLabel withConstraints: [ :constraints | 
					   constraints
						   fill: false;
						   yourself ];
				   yourself);
		  add: #paneMenu width: 50;
		  yourself
]

{ #category : 'initialization' }
SpkPane >> initializePresenters [

	paneIcon := self newImage
		            image: (self iconNamed: #glamorousGrayCircleEmpty);
		            yourself.
	paneLabel := self newLabel.
	paneMenu := self newMenuButton
		            icon: (self iconNamed: #hamburgerWhite16);
		            yourself
]

{ #category : 'accessing' }
SpkPane >> paneIcon [
	^ paneIcon
]

{ #category : 'accessing' }
SpkPane >> paneIcon: anObject [
	paneIcon := anObject
]

{ #category : 'accessing' }
SpkPane >> paneLabel [
	^ paneLabel
]

{ #category : 'accessing' }
SpkPane >> paneLabel: anObject [
	paneLabel := anObject
]

{ #category : 'accessing' }
SpkPane >> paneMenu [
	^ paneMenu
]

{ #category : 'accessing' }
SpkPane >> paneMenu: anObject [
	paneMenu := anObject
]
