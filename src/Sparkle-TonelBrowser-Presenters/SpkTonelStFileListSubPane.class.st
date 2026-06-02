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

{ #category : 'instance creation' }
SpkTonelStFileListSubPane >> newFileAction [

	^ [ self createClassFile ]
]

{ #category : 'instance creation' }
SpkTonelStFileListSubPane >> newFileHelp [

	^ 'Create a new class file'
]

{ #category : 'asserting' }
SpkTonelStFileListSubPane >> shouldBeInitiallyShown [

	^ true
]
