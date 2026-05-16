Class {
	#name : 'SpkTonelDewFileListSubPane',
	#superclass : 'SpkTonelFileListSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'as yet unclassified' }
SpkTonelDewFileListSubPane >> fileTypeLabel [

	^ 'Library'
]

{ #category : 'api' }
SpkTonelDewFileListSubPane >> listItems [

	^ model dewServices
]

{ #category : 'asserting' }
SpkTonelDewFileListSubPane >> shouldBeInitiallyShown [

	^ false
]
