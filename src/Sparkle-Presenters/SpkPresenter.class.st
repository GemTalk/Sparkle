"
Abstract superclass for Sparkle presenters.

Provides various overrides of default Spec2 behavior to add or modify functionality.

Instance variables 
*	containingPresenter <SpkPresenter or nil> Except for presenters at the window level, all Sparkle presenters keep track of the presenter that contains them. For Window-level presenters, this is nil. 
"
Class {
	#name : 'SpkPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'containingPresenter'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'work in progress' }
SpkPresenter class >> notYetImplemented: aString [

	"Use this message for actions not yet implemented. 
	Browse senders of this message to find some of the things that still need to be worked on.
	'shucks' courtesy of Mark Roder, 1994."

	self inform: aString , ' not yet implemented (shucks)'
]

{ #category : 'accessing' }
SpkPresenter >> iconNamed: aSymbol [
	^ self application iconNamed: aSymbol
]

{ #category : 'widgets' }
SpkPresenter >> newButton [

	^ self instantiate: SpkButtonPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newLabel [

	^ self instantiate: SpkLabelPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newMenuButton [

	^ self instantiate: SpkMenuButtonPresenter
]

{ #category : 'work in progress' }
SpkPresenter >> notYetImplemented: aString [

	self class notYetImplemented: aString
]
