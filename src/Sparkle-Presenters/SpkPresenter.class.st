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
		'spkLayout'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'specs' }
SpkPresenter class >> defaultSpec [

	"This method only here to quiet browser linting. Should never be sent to this class.
	Sparkle layouts are created and managed dynamically.
	See instance-side #layout."

	self error: '#defaultSpec sent when not expected'
]

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

{ #category : 'accessing' }
SpkPresenter >> layout [

	"Cannot use the instvar 'layout' since it is defined in a superclass as an observable slot."

	^ spkLayout ifNil: [ spkLayout := self newLayout ]
]

{ #category : 'widgets' }
SpkPresenter >> newButton [

	^ self instantiate: SpkButtonPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newIconButton [

	^ self instantiate: SpkIconButtonPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newLabel [

	^ self instantiate: SpkLabelPresenter
]

{ #category : 'accessing' }
SpkPresenter >> newLayout [

	self subclassResponsibility
]

{ #category : 'widgets' }
SpkPresenter >> newMenuButton [

	^ self instantiate: SpkMenuButtonPresenter
]

{ #category : 'widgets' }
SpkPresenter >> newTable [

	^ self instantiate: SpkMultipleSelectionTablePresenter
]

{ #category : 'work in progress' }
SpkPresenter >> notYetImplemented: aString [

	self class notYetImplemented: aString
]
