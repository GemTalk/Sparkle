Class {
	#name : 'SpkDebuggerFramePaneHeader',
	#superclass : 'SpkPaneHeader',
	#instVars : [
		'label'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkDebuggerFramePaneHeader >> frameDescription [

	^ model description
]

{ #category : 'accessing colors' }
SpkDebuggerFramePaneHeader >> headerColor [

	^ Color fromHexString: '682828'
]

{ #category : 'initialization' }
SpkDebuggerFramePaneHeader >> initializePresenters [

	super initializePresenters.
	label := self newLabel.
	label
		addStyle: 'label.paneHeader';
		label: self frameDescription.

	labelLayout add: label withConstraints: [ :c | c fill: false ]
]

{ #category : 'display' }
SpkDebuggerFramePaneHeader >> showLinkage: aBoolean [

	"Show or hide my linkedFrom subpart depending on aBoolean"
	
	"Debugger frame panes cannot be made independent of their debugger pane, so don't ever show the linkedFrom"
]
