Class {
	#name : 'SpkConnectionListPresenterB',
	#superclass : 'SpkPresenter',
	#instVars : [
		'connectionList',
		'toolbar',
		'bigBox',
		'connectionsBox',
		'filterInput',
		'insecureConnectionPresenter',
		'connectionsNotebook',
		'gciConnectionPresenter',
		'processListButton',
		'evaluatorButton',
		'browserButton'
	],
	#category : 'Sparkle-Presenters-Presenters',
	#package : 'Sparkle-Presenters',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
SpkConnectionListPresenterB class >> defaultColor [

	^ UITheme current class == PharoDarkTheme
		  ifTrue: [ Color purple muchDarker ]
		  ifFalse: [ Color purple muchLighter ]
]

{ #category : 'accessing' }
SpkConnectionListPresenterB >> activeConnectionPage [

	^ connectionsNotebook selectedPage activePresenter
]

{ #category : 'building menus' }
SpkConnectionListPresenterB >> buildHamburgerMenu [ 

	| commandGroup |
	commandGroup := (CmCommandGroup named: 'Null') asSpecGroup
		description: 'Nothing to see here yet';
		beDisplayedAsGroup;
		yourself.
	^commandGroup
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> connectPresenters [

	super connectPresenters.
	connectionList whenSelectionChangedDo: [ :selection | 
		selection selectedItems size > 1
			ifTrue: [ self initializeConnectionProfileTabs ]
			ifFalse: [ 
				selection selectedItem
					ifNil: [ self initializeConnectionProfileTabs ]
					ifNotNil: [ :connectionProfile | 
					self setConnectionProfile: connectionProfile ] ] ]
]

{ #category : 'layout' }
SpkConnectionListPresenterB >> defaultLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'actions' }
SpkConnectionListPresenterB >> filterConnections [

	filterInput text = $# asString ifTrue: [ 
		^connectionList items:
			(SpkConnectionProfile profiles select: [ :profile | 
				 profile group = String new ]) ].
	connectionList items:
		(SpkConnectionProfile profiles select: [ :profile | 
			 | ws |
			 ws := (WriteStream on: String new)
				       nextPutAll: filterInput text;
				       nextPut: $*;
				       yourself.
			 ws contents match: profile group ])
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> initialize [

	super initialize.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileAddedAnnouncement
		send: #profileAdded:
		to: self.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileRemovedAnnouncement
		send: #profileRemoved:
		to: self.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileChangedAnnouncement
		send: #profileChanged:
		to: self.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileConnectedAnnouncement
		send: #updateGUI
		to: self.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileDisconnectedAnnouncement
		send: #updateGUI
		to: self
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> initializeConnectionList [

	connectionsBox add: (SpkBoxLayout newVertical
			 add: (self newLabel label: 'Connection Profiles')
			 withConstraints: [ :constraints | constraints height: 25 ];
			 add: (connectionList := self newTable beSingleSelection
					                    sortingBlock: [ :a :b | a name < b name ];
					                    addColumn: (SpImageTableColumn new
							                     width: 25;
							                     evaluated: [ :profile | 
								                     self showConnectionIndicatorFor: profile ]);
					                    addColumn: (SpStringTableColumn new
							                     title: 'Name';
							                     sortFunction: #name ascending;
							                     width: 100;
							                     evaluated: #name);
					                    addColumn: (SpStringTableColumn new
							                     title: 'Group';
							                     width: 100;
							                     sortFunction: #group ascending;
							                     evaluated: #group);
					                    addColumn: (SpStringTableColumn new
							                     title: 'Details';
							                     evaluated: #displayString;
							                     sortFunction: #displayString ascending);
					                    items: OrderedCollection new;
					                    yourself);
			 yourself).
	connectionList items: SpkConnectionProfile profiles.
	^ connectionList
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> initializeConnectionPresenterTabs [

	connectionsNotebook := self newNotebook.
	bigBox
		add: connectionsNotebook.
	gciConnectionPresenter := self instantiate: SpkGciConnectionPresenter.
	connectionsNotebook addPage: (SpNotebookPage
			 title: 'GCI'
			 icon: nil
			 provider: [ gciConnectionPresenter ]).
	insecureConnectionPresenter := self instantiate:
		                               SpkInsecureConnectionPresenterB.
	connectionsNotebook addPage: (SpNotebookPage
			 title: 'Direct'
			 icon: nil
			 provider: [ insecureConnectionPresenter ])
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> initializeConnectionProfileTabs [

	insecureConnectionPresenter ifNotNil: [ :presenter | 
		presenter initializeConnectionProfile ].
	gciConnectionPresenter ifNotNil: [ :presenter | 
		presenter initializeConnectionProfile ]
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> initializeGroupFilter [

	filterInput := self newTextInput
		               whenTextChangedDo: [ self filterConnections ];
		               autoAccept: true;
		               placeholder: 'Enter # to show empty group names only';
		               yourself.
	connectionsBox
		add: (self instantiate: (SpLabeledPresenter
					  label: 'Group Filter:'
					  input: filterInput
					  description: String new))
		withConstraints: [ :constraints | constraints height: 25 ]
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> initializePresenters [

	super initializePresenters.
	bigBox := SpkBoxLayout newHorizontal.
	self layout add: bigBox.
	connectionsBox := SpBoxLayout newVertical.
	bigBox
		add: connectionsBox
		withConstraints: [ :constraints | constraints width: 500 ].
	self initializeToolbar.
	self initializeConnectionList.
	self initializeGroupFilter.
	self initializeConnectionPresenterTabs.
	self initializeUnselectedProfile.
	self layout color: self class defaultColor
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> initializeToolbar [

	toolbar := self newToolbar
		           addItem: (SpToolbarButtonPresenter new
				            label: 'Save';
				            icon: (self iconNamed: #smallSave);
				            help: 'Save profiles to a file';
				            action: [ self saveToFile ];
				            yourself);
		           addItem: (SpToolbarButtonPresenter new
				            label: 'Load';
				            icon: (self iconNamed: #smallOpen);
				            help: 'Restore profiles from a file';
				            action: [ self loadFromFile ];
				            yourself);
		           addItem: (evaluatorButton := SpToolbarButtonPresenter new
				                              label: 'Evaluator';
				                              icon:
					                              (self iconNamed:
							                               #smallSystemBrowser);
				                              help: 'Open a Sparkle Inspector with Evaluator';
				                              action: [ self newEvaluator ];
				                              yourself);
		           addItem: (processListButton := SpToolbarButtonPresenter new
				                              label: 'Processes';
				                              icon:
					                              (self iconNamed:
							                               #smallSystemBrowser);
				                              help: 'Open a Process List Explorer';
				                              action: [ self newProcessList ];
				                              yourself);
		           addItem: (browserButton := SpToolbarButtonPresenter new
				                             label: 'Stopwatch';
				                             icon: (self iconNamed: #proceed28);
				                             help: 'Open a stopwatch';
				                             action: [ self newStopwatch ];
				                             yourself);		           yourself.
	connectionsBox
		add: #toolbar
		expand: false
		fill: false
		padding: 0
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> initializeUnselectedProfile [

	insecureConnectionPresenter ifNotNil: [ :presenter | 
		presenter initializeUnselectedProfile ].
	gciConnectionPresenter ifNotNil: [ :presenter | 
		presenter initializeUnselectedProfile ]
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Launcher';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 800 @ 450;
		whenClosedDo: [ 
			SpkConnectionProfile profileAnnouncer unsubscribe: self.
			SpkConnectionProfile profileAnnouncer unsubscribe:
					gciConnectionPresenter.
			SpkConnectionProfile profileAnnouncer unsubscribe:
					insecureConnectionPresenter ]
]

{ #category : 'testing' }
SpkConnectionListPresenterB >> isConnectedProfileSelected [

	connectionList selectedItem ifNil: [ ^ false ].
	^ connectionList selectedItem isConnected
]

{ #category : 'actions' }
SpkConnectionListPresenterB >> loadFromFile [

	| path stream profiles |
	(self confirm: 'This will replace the connection profiles. Continue?') ifFalse:[^self].
	path := UIManager default
		        chooseExistingFileReference:
		        'Restore Connection Profiles As ...'
		        extensions: #( 'ston' )
		        path: 'profiles'.
	path ifNil: [ ^ self ].
	stream := path asFileReference readStream.
	profiles := (STON reader on: stream) next.
	(profiles isKindOf: Collection) ifFalse: [ 
		^ self inform: 'Improper connection profiles file' "need a better sanity check on what is restored" ].
	SpkConnectionProfile profiles: profiles.
	connectionList items: SpkConnectionProfile profiles
]

{ #category : 'actions' }
SpkConnectionListPresenterB >> newEvaluator [

	| selection |
	connectionList selectedItem ifNil:[^self notify: 'Must select connected profile']. 
	selection := connectionList selectedItem. 
	selection isConnected ifFalse:[^self notify: 'Must select connected profile'].
	selection newEvaluator
]

{ #category : 'actions' }
SpkConnectionListPresenterB >> newProcessList [

	| selection |
	connectionList selectedItem ifNil:[^self notify: 'Must select connected profile']. 
	selection := connectionList selectedItem. 
	selection isConnected ifFalse:[^self notify: 'Must select connected profile'].
	selection newProcessListExplorer
]

{ #category : 'actions' }
SpkConnectionListPresenterB >> newStopwatch [

	| selection |
	connectionList selectedItem ifNil:[^self notify: 'Must select a connected profile']. 
	selection := connectionList selectedItem. 
	selection isConnected ifFalse:[^self notify: 'Must select a connected profile'].
	selection newStopwatch
]

{ #category : 'events' }
SpkConnectionListPresenterB >> profileAdded: announcement [

	"for now, assume only one profile can be added at a time"

	| profile |
	profile := announcement profiles first.
	connectionList items: connectionList items , (Array with: profile).
	connectionList selectItem: profile.
	self update. 
]

{ #category : 'events' }
SpkConnectionListPresenterB >> profileChanged: announcement [

	self update. 
]

{ #category : 'events' }
SpkConnectionListPresenterB >> profileRemoved: announcement [

	connectionList items:
		(connectionList items copyWithoutAll: announcement profiles)
]

{ #category : 'actions' }
SpkConnectionListPresenterB >> saveToFile [
	| path fileRef |
	path := UIManager default 
		chooseForSaveFileReference: 'Save Connection Profiles As ...'
		extensions: #('ston') 
		path: 'profiles'.
	path ifNil: [ ^self].
	fileRef := path asFileReference. 
	^ fileRef writeStreamDo: [ :stream | 
		  STON writer
			  on: stream;
			  nextPut: SpkConnectionProfile profiles ]
]

{ #category : 'initialization' }
SpkConnectionListPresenterB >> setConnectionProfile: connectionProfile [

	connectionProfile isGciProfile
		ifTrue: [ 
		connectionsNotebook selectPageIndex: 1 "need to fix. Avoid constant" ]
		ifFalse: [ 
		connectionsNotebook selectPageIndex: 2 "need to fix. Avoid constant" ].
	^ self activeConnectionPage setConnectionProfile:
		  connectionProfile
]

{ #category : 'actions' }
SpkConnectionListPresenterB >> showConnectionIndicatorFor: profile [

	^ profile isConnected
		  ifTrue: [ self iconNamed: #smallOk ]
		  ifFalse: [ nil ]
]

{ #category : 'actions' }
SpkConnectionListPresenterB >> updateGUI [

	self update.
]
