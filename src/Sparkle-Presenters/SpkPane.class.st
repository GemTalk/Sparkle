"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpkPresenter',
	#instVars : [
		'model',
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

	^ 24
]

{ #category : 'layout' }
SpkPane class >> headerLayout [

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
		  add: #paneMenu width: 24;
		  yourself
]

{ #category : 'initialization' }
SpkPane >> initializePresenters [

	paneIcon := self newImage
		            image: (self iconNamed: #glamorousGrayCircleEmpty);
		            yourself.
	paneLabel := self newLabel.
	paneMenu := self newMenuButton
		            color: Color transparent;
		            menu: self newPaneMenu;
		            icon: (self iconNamed: #hamburgerWhite16);
		            yourself
]

{ #category : 'accessing' }
SpkPane >> model [
	^ model
]

{ #category : 'instance creation' }
SpkPane >> newPaneMenu [

	self subclassResponsibility
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

{ #category : 'accessing' }
SpkPane >> setModelBeforeInitialization: anObject [

	model := anObject
]
