Class {
	#name : 'SpkTonelDewFileListSubPane',
	#superclass : 'SpkTonelFileListSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
SpkTonelDewFileListSubPane >> fileTypeLabel [

	^ 'Library'
]

{ #category : 'api' }
SpkTonelDewFileListSubPane >> listItems [

	^ model dewServices
]

{ #category : 'instance creation' }
SpkTonelDewFileListSubPane >> newFileAction [

	^ [ self notYetImplemented: 'Sorry, library files' ]
]

{ #category : 'instance creation' }
SpkTonelDewFileListSubPane >> newFileHelp [

	^ 'Create a new library file'
]

{ #category : 'asserting' }
SpkTonelDewFileListSubPane >> shouldBeInitiallyShown [

	^ false
]
