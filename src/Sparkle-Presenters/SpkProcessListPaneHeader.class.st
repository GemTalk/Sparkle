Class {
	#name : 'SpkProcessListPaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'label'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing colors' }
SpkProcessListPaneHeader >> headerColor [

	^ Color fromHexString: '463bb8'
]

{ #category : 'initialization' }
SpkProcessListPaneHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label
		label: 'All Processes';
		addStyle: 'label.paneHeader'.

	labelLayout add: label withConstraints: [ :c | c fill: false ]
]
