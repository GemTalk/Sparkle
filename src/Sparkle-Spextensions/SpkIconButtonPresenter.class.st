"
A simple button represented by two icons, one for when the button is enabled and one for when it is disabled.
"
Class {
	#name : 'SpkIconButtonPresenter',
	#superclass : 'SpkButtonPresenter',
	#traits : 'SpkTPresenter',
	#classTraits : 'SpkTPresenter classTrait',
	#instVars : [
		'enabledIcon',
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

	^ disabledIcon
]

{ #category : 'accessing' }
SpkIconButtonPresenter >> disabledIcon: anObject [

	disabledIcon := anObject
]

{ #category : 'api' }
SpkIconButtonPresenter >> enabled: requestedBoolean [

	"enabled is an ObservableSlot"

	enabled := self enablementFrom: requestedBoolean.
	self updateIcon
]

{ #category : 'accessing' }
SpkIconButtonPresenter >> enabledIcon [

	^ enabledIcon
]

{ #category : 'accessing' }
SpkIconButtonPresenter >> enabledIcon: anObject [

	enabledIcon := anObject
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

{ #category : 'accessing' }
SpkIconButtonPresenter >> enablementFrom: requestedBoolean [

	^ self enablementCondition value: requestedBoolean
]

{ #category : 'accessing' }
SpkIconButtonPresenter >> help: helpString [

	"Allow tooltip to be dynamically changed."

	super help: helpString.
	"Adapter is usually nil when first creating presenter, 
	but the instvar will be used when building."
	adapter ifNotNil: [ :a | a setBalloonText: helpString ]
]

{ #category : 'api' }
SpkIconButtonPresenter >> icon [

	^ icon ifNil: [ self updateIcon ]
]

{ #category : 'api' }
SpkIconButtonPresenter >> icon: aForm [

	"This message should only be sent if the same icon 
	is used for enabled and disabled states."

	icon := enabledIcon := disabledIcon := aForm
]

{ #category : 'updating' }
SpkIconButtonPresenter >> updateIcon [

	"icon is an ObservableSlot, can't 
	answer the value of the assignment."

	icon := enabled
		        ifTrue: [ enabledIcon ]
		        ifFalse: [ disabledIcon ].
	^ icon
]
