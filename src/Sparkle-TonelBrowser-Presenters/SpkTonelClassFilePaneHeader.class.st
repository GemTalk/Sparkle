Class {
	#name : 'SpkTonelClassFilePaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'label',
		'deleteButton'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Headers',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Headers'
}

{ #category : 'accessing colors' }
SpkTonelClassFilePaneHeader >> headerColor [

	^ Color fromHexString: '2f5531'
]

{ #category : 'initialization' }
SpkTonelClassFilePaneHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label addStyle: 'label.paneHeader'.
	labelLayout add: label withConstraints: [ :c | c fill: false ].
	deleteButton := self newIconButton
		                icon: (self iconNamed: #deleteFile20);
		                help: 'Delete this class';
		                action: [ owner deleteFile ];
		                yourself.
	mainLayout
		add: deleteButton
		before: menuButton
		withConstraints: [ :c | c width: 20 ];
		remove: menuButton
]

{ #category : 'accessing' }
SpkTonelClassFilePaneHeader >> labelString: aString [

	label label: aString
]
