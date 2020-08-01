"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I class take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpPresenter',
	#instVars : [
		'paneLabel'
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
		  add: #paneLabel;
		  yourself
]

{ #category : 'initialization' }
SpkPane >> initializePresenters [
	paneLabel := self newLabel
]

{ #category : 'accessing' }
SpkPane >> paneLabel [
	^ paneLabel
]

{ #category : 'accessing' }
SpkPane >> paneLabel: anObject [
	paneLabel := anObject
]
