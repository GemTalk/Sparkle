Class {
	#name : 'SpkProcessListToolbar',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'refreshButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkProcessListToolbar >> initializePresenters [

	super initializePresenters.
	self initializeRefreshButton
]

{ #category : 'initialization' }
SpkProcessListToolbar >> initializeRefreshButton [

	refreshButton := self newButton
		label: 'Refresh';
		icon: (self iconNamed: #refresh);
		color: Color veryDarkGray;
		action: [ self refresh ].
	self layout
		add: refreshButton
		withConstraints: [ :c | c height: 24; width: 100]
]

{ #category : 'accessing' }
SpkProcessListToolbar >> newLayout [

	^ SpkBoxLayout newHorizontal
]

{ #category : 'actions' }
SpkProcessListToolbar >> refresh [

	self pane disableAll.
	model synchronizeTaskspace
]

{ #category : 'accessing' }
SpkProcessListToolbar >> toolbarHeight [

	^ 30
]
