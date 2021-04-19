"
A simple button represented by two icons, one for when the button is enabled and one for when it is disabled.
"
Class {
	#name : 'SpkIconButtonPresenter',
	#superclass : 'SpkButtonPresenter',
	#instVars : [
		'disabledIcon'
	],
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkIconButtonPresenter class >> adapterName [

	^ #SpkIconButtonAdapter
]

{ #category : 'accessing' }
SpkIconButtonPresenter >> disabledIcon [

	^ disabledIcon ifNil: [ icon ]
]

{ #category : 'accessing' }
SpkIconButtonPresenter >> disabledIcon: anObject [

	disabledIcon := anObject
]

{ #category : 'api' }
SpkIconButtonPresenter >> enabled: aBoolean [

	super enabled: aBoolean.
	self updateIcon
]

{ #category : 'api' }
SpkIconButtonPresenter >> icon [

	^ self isEnabled
		  ifTrue: [ icon ]
		  ifFalse: [ self disabledIcon ]
]

{ #category : 'api' }
SpkIconButtonPresenter >> updateIcon [

	self withAdapterDo: [ :a | a icon: self icon ]
]
