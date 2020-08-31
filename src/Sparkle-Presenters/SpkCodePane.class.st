"
I am an abstract class that knows how to display and allow editing of code.
This differs from a plain text editor in several ways:

* Syntax highlighting and checking
* Possibly auto-completing
* Has the marker in the corner if the text has been edited.
"
Class {
	#name : 'SpkCodePane',
	#superclass : 'SpkPane',
	#instVars : [
		'codePresenter'
	],
	#category : 'Sparkle-Presenters'
}

{ #category : 'specs' }
SpkCodePane class >> defaultSpec [
	^ super defaultSpec
		  add: #codePresenter;
		  yourself
]

{ #category : 'accessing' }
SpkCodePane >> codePresenter [
	^ codePresenter
]

{ #category : 'accessing' }
SpkCodePane >> codePresenter: anObject [
	codePresenter := anObject
]

{ #category : 'initialization' }
SpkCodePane >> initializePresenters [

	super initializePresenters.
	codePresenter := self instantiate: SpkCodePresenter.
	self focusOrder add: codePresenter
]
