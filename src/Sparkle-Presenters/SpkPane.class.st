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

{ #category : 'values' }
SpkPane class >> headerHeight [
	^20
]

{ #category : 'layout' }
SpkPane class >> headerLayout [
	^ SpBoxLayout newHorizontal
		  add: #paneIcon width: 16;
		  add: #paneLabel;
		  add: #paneMenu width: 20;
		  yourself
]

{ #category : 'accessing colors' }
SpkPane >> headerColor [
	self subclassResponsibility
]

{ #category : 'initialization' }
SpkPane >> initializePresenters [
	paneIcon := self newImage
		            image: (self iconNamed: #glamorousGrayCircleEmpty);
		            color: self headerColor;
		            yourself.
	paneLabel := self newLabel
		             color: self headerColor;
		             yourself.
	paneMenu := self newMenuButton
		            icon: (self iconNamed: #hamburgerWhite16);
		            color: self headerColor;
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
