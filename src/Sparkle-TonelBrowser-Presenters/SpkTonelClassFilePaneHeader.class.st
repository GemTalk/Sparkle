Class {
	#name : 'SpkTonelClassFilePaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'label',
		'deleteButton'
	],
	#category : 'Sparkle-TonelBrowser-Presenters-Presenters',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Presenters'
}

{ #category : 'initialization' }
SpkTonelClassFilePaneHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label addStyle: 'label.paneHeader'.
	labelLayout add: label withConstraints: [ :c | c fill: false ].
	deleteButton := self newIconButton
		                icon: (self iconNamed: #terminate28);
		                help: 'Delete this class';
		                action: [ owner deleteFile ];
		                yourself.
	mainLayout
		add: deleteButton
		before: menuButton
		withConstraints: [ :c | c width: 28 ]
]

{ #category : 'accessing' }
SpkTonelClassFilePaneHeader >> labelString: aString [

	label label: aString
]
