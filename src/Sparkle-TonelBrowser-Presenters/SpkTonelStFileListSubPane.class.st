Class {
	#name : 'SpkTonelStFileListSubPane',
	#superclass : 'SpkTonelFileListSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'as yet unclassified' }
SpkTonelStFileListSubPane >> fileTypeLabel [

	^ 'Class'
]

{ #category : 'api' }
SpkTonelStFileListSubPane >> listItems [

	^ model stServices
]

{ #category : 'asserting' }
SpkTonelStFileListSubPane >> shouldBeInitiallyShown [

	^ true
]
