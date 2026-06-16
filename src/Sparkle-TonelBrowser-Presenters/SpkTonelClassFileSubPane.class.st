Class {
	#name : 'SpkTonelClassFileSubPane',
	#superclass : 'SpkPresenterWithModel',
	#traits : 'SpkTTwizzledList',
	#classTraits : 'SpkTTwizzledList classTrait',
	#instVars : [
		'listTwizzle'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'as yet unclassified' }
SpkTonelClassFileSubPane >> contentTypeString [

	self subclassResponsibility
]

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
		twizzleHelp: 'Show or hide the list of ' , self contentTypeString;
		subPresenter: list;
		showSubPresenter: self shouldBeInitiallyShown
]

{ #category : 'api' }
SpkTonelClassFileSubPane >> listItems [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SpkTonelClassFileSubPane >> listLabelString [

	self subclassResponsibility
]

{ #category : 'asserting' }
SpkTonelClassFileSubPane >> shouldBeInitiallyShown [

	^ false
]
