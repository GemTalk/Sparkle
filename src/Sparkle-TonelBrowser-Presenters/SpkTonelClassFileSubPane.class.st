Class {
	#name : 'SpkTonelClassFileSubPane',
	#superclass : 'SpkPresenterWithModel',
	#traits : 'SpkTTwizzledList',
	#classTraits : 'SpkTTwizzledList classTrait',
	#instVars : [
		'listTwizzle'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Subpanes',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Subpanes'
}

{ #category : 'layout' }
SpkTonelClassFileSubPane >> defaultLayout [

	^ SpkBoxLayout newVertical
		  color: Color veryVeryDarkGray;
		  yourself
]

{ #category : 'initialization' }
SpkTonelClassFileSubPane >> ensureList [
	"Make sure the list has been initialized."

	self list ifNil: [ self initializeTwizzledList ]
]

{ #category : 'initialization' }
SpkTonelClassFileSubPane >> initializeListColumns [

	self list addColumn:
		(SpStringTableColumn evaluated: [ :item | item model displayName ])
]

{ #category : 'initialization' }
SpkTonelClassFileSubPane >> initializeTwizzledList [

	self initializeList.
	"I can't own the twizzledList or it would always take spece even when closed."
	twizzledList := owner instantiate: SpkTwizzledPresenter.
	twizzledList
		twizzleHelp: 'Show or hide the list of ' , self listLabelString;
		subPresenter: self list;
		showSubPresenter: self shouldBeInitiallyShown
]

{ #category : 'actions' }
SpkTonelClassFileSubPane >> itemSelected: anAnnouncement [
	"This announcement comes from the UI, not a service, so does not need to be deferred."

	| field itemService |
	field := anAnnouncement item.
	itemService := field model.
	field openLinkedPane: itemService
]

{ #category : 'api' }
SpkTonelClassFileSubPane >> listItems [

	^ self subclassResponsibility
]

{ #category : 'as yet unclassified' }
SpkTonelClassFileSubPane >> listLabelString [

	self subclassResponsibility
]

{ #category : 'asserting' }
SpkTonelClassFileSubPane >> shouldBeInitiallyShown [

	^ true
]
