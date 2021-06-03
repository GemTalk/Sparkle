Class {
	#name : 'SpkSparkyWorkspacePresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'toolbar',
		'workspace'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkSparkyWorkspacePresenter >> debugIt [ 

	workspace debugIt
	
]

{ #category : 'actions' }
SpkSparkyWorkspacePresenter >> doIt [ 

	workspace doIt
	
]

{ #category : 'initialization' }
SpkSparkyWorkspacePresenter >> initializePresenters [ 
	super initializePresenters. 
	self initializeToolbar.  
	self layout add: (workspace := self instantiate: SpkWorkspacePresenter).
	self layout color: SpkConnectionListPresenter defaultColor
	
]

{ #category : 'initialization' }
SpkSparkyWorkspacePresenter >> initializeToolbar [

	toolbar := self newToolbar.
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Do It';
			 icon: (self iconNamed: #smallDoIt);
			 action: [ self doIt ];
			 yourself).
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Print It';
			 icon: (self iconNamed: #smallPrintIt);
			 action: [ self printIt ];
			 yourself).
		toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Debug It';
			 icon: (self iconNamed: #smallDebug);
			 action: [ self debugIt ];
			 yourself).
	self layout
		add: toolbar
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkSparkyWorkspacePresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparky Workspace';
		initialExtent: 400 @ 300.
]

{ #category : 'accessing' }
SpkSparkyWorkspacePresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'actions' }
SpkSparkyWorkspacePresenter >> printIt [ 

	workspace printIt
	
]

{ #category : 'accessing' }
SpkSparkyWorkspacePresenter >> text: aString [ 

	workspace text: aString
]
