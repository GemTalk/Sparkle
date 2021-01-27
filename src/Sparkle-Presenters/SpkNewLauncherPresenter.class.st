Class {
	#name : 'SpkNewLauncherPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'connectionList',
		'toolbar'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkNewLauncherPresenter >> createNewConnection [

	connectionList items add: SparkleConnectionProfile new
]

{ #category : 'initialization' }
SpkNewLauncherPresenter >> initializeConnectionList [

	| newList |
	self layout add: (SpkBoxLayout newVertical
			 add: (newList := self newTable
					             addColumn:
						             (SpStringTableColumn title: 'Name' evaluated: #name);
					             addColumn:
						             (SpStringTableColumn title: 'Host' evaluated: #host);
					             addColumn:
						             (SpStringTableColumn title: 'Port' evaluated: #port);
					             yourself);
			 yourself).
	^ newList
]

{ #category : 'initialization' }
SpkNewLauncherPresenter >> initializeNewButton [

	toolbar
		add: (self newButton
				 label: 'New';
				 action: [ self createNewConnection ])
		withConstraints: [ :constraints | constraints width: 75; height: 30 ]
]

{ #category : 'initialization' }
SpkNewLauncherPresenter >> initializePresenters [

	self initializeToolbar.
	self initializeConnectionList
]

{ #category : 'initialization' }
SpkNewLauncherPresenter >> initializeToolbar [
	"Not really a toolbar yet"
	toolbar := SpkBoxLayout newHorizontal. 
	self initializeNewButton. 
	self layout add: toolbar withConstraints: [:constraints | constraints height: 50].
]

{ #category : 'initialization' }
SpkNewLauncherPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Launcher';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 300 @ 300
]

{ #category : 'accessing' }
SpkNewLauncherPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]
