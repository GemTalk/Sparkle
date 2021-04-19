"
A simple button represented by two icons, one for when the button is enabled and one for when it is disabled.
"
Class {
	#name : 'SpkIconButtonPresenter',
	#superclass : 'SpkButtonPresenter',
	#instVars : [
		'disabledIcon',
		'enablementCondition'
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

	enabled := self enablementCondition value: aBoolean.
	self updateIcon
]

{ #category : 'accessing' }
SpkIconButtonPresenter >> enablementCondition [
	"This enablement condition allows the button to
	reflect on whether its model wishes it to be
	enabled as well as transitory GUI actions."

	^enablementCondition ifNil: [[:aBoolean | aBoolean]]
]

{ #category : 'accessing' }
SpkIconButtonPresenter >> enablementCondition: aBlock [
	"This enablement condition allows the button to
	reflect on whether its model wishes it to be
	enabled as well as transitory GUI actions."

	enablementCondition := aBlock
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
