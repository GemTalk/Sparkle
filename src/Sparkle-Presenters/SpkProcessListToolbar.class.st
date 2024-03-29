Class {
	#name : 'SpkProcessListToolbar',
	#superclass : 'SpkPresenterWithModel',
	#instVars : [
		'refreshButton'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'layout' }
SpkProcessListToolbar >> defaultLayout [

	^ SpkBoxLayout newHorizontal
		  placeWidgetsAtCenter;
		  yourself
]

{ #category : 'initialization' }
SpkProcessListToolbar >> initializePresenters [

	super initializePresenters.
	self initializeRefreshButton
]

{ #category : 'initialization' }
SpkProcessListToolbar >> initializeRefreshButton [

	refreshButton := self newIconButton
		                 help: 'Refresh';
		                 icon: (self iconNamed: #refresh28);
		                 action: [ self refresh ].
	self layout add: refreshButton withConstraints: [ :c | 
		c
			height: 30;
			width: 30 ]
]

{ #category : 'actions' }
SpkProcessListToolbar >> refresh [

	self pane disableAll.
	model synchronizeTaskspace
]

{ #category : 'accessing' }
SpkProcessListToolbar >> toolbarHeight [

	^ 34
]
