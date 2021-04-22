Class {
	#name : 'SpkStandAloneWorkspacePresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'toolbar',
		'workspace'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkStandAloneWorkspacePresenter >> doIt [ 

	workspace doIt
	
]

{ #category : 'initialization' }
SpkStandAloneWorkspacePresenter >> initializePresenters [ 
	super initializePresenters. 
	self initializeToolbar.  
	self layout add: (workspace := self instantiate: SpkWorkspacePresenter).
	self layout color: SpkConnectionListPresenter defaultColor
	
]

{ #category : 'initialization' }
SpkStandAloneWorkspacePresenter >> initializeToolbar [

	toolbar := self newToolbar.
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Do It';
			 icon: (self iconNamed: #smallForward);
			 action: [ self doIt ];
			 yourself).
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Print It';
			 icon: (self iconNamed: #smallCancel);
			 action: [ self printIt ];
			 yourself).
	self layout
		add: toolbar
		withConstraints: [ :constraints | constraints height: 25 ]
]

{ #category : 'initialization' }
SpkStandAloneWorkspacePresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Workspace';
		initialExtent: 400 @ 300.
]

{ #category : 'accessing' }
SpkStandAloneWorkspacePresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'actions' }
SpkStandAloneWorkspacePresenter >> printIt [ 

	workspace printIt
	
]
