Class {
	#name : 'SpkTonelFileListSubPane',
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

{ #category : 'layout' }
SpkTonelFileListSubPane >> defaultLayout [

	^ SpkBoxLayout newVertical
		  color: Color veryVeryDarkGray;
		  yourself
]

{ #category : 'as yet unclassified' }
SpkTonelFileListSubPane >> ensureList [
	"Make sure the list has been initialized."

	self list ifNil: [ self initializeFileList ]
]

{ #category : 'as yet unclassified' }
SpkTonelFileListSubPane >> fileTypeLabel [

	self subclassResponsibility
]

{ #category : 'initialization' }
SpkTonelFileListSubPane >> initializeFileList [

	self initializeTwizzledList
]

{ #category : 'initialization' }
SpkTonelFileListSubPane >> initializeListColumns [

	self list addColumn:
		(SpStringTableColumn evaluated: [ :item | item model filename ])
]

{ #category : 'initialization' }
SpkTonelFileListSubPane >> initializeTwizzledList [

	self initializeList.
	"I can't own the twizzledList or it would always take spece even when closed."
	twizzledList := owner instantiate: SpkTwizzledPresenter.
	twizzledList
		twizzleHelp:
			'Show or hide the list of ' , self fileTypeLabel , ' files';
		subPresenter: list;
		showSubPresenter: self shouldBeInitiallyShown
]

{ #category : 'accessing' }
SpkTonelFileListSubPane >> listLabelString [

	| count result |
	count := listModel size.
	result := String streamContents: [ :s |
		          count = 0
			          ifTrue: [ s << 'No' ]
			          ifFalse: [ count printOn: s ].
		          s
			          space;
			          << self fileTypeLabel;
			          << ' File'.
		          count = 1 ifFalse: [ s << 's' ] ].
	^ result
]

{ #category : 'asserting' }
SpkTonelFileListSubPane >> shouldBeInitiallyShown [

	self subclassResponsibility
]
