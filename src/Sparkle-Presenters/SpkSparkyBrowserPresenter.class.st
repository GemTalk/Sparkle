Class {
	#name : 'SpkSparkyBrowserPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'projects',
		'projectList',
		'packages',
		'packageList',
		'classList',
		'classes',
		'toolbar',
		'sourceCode',
		'sourceTabs',
		'classDefinitionPresenter',
		'menu',
		'allClassNames'
	],
	#classVars : [
		'AnsweringService',
		'BrowserAnnouncer',
		'BrowserService',
		'ClassServices',
		'PackageServices',
		'ProjectServices'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> answeringService [

	AnsweringService ifNil: [ 
		AnsweringService := SpkScaffoldingAnsweringServiceClient new 
			                  registerWith:
			                  SpkConnectionProfile defaultConnection ].
	^ AnsweringService
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> browserAnnouncer [

	^ BrowserAnnouncer ifNil: [ BrowserAnnouncer := Announcer new ]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> browserService [

	BrowserService ifNil: [ 
		BrowserService := SpkScaffoldingBrowserServiceClient new 
			                  registerWith:
			                  SpkConnectionProfile defaultConnection ].
	^ BrowserService
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> classServiceNamed: className [

	^ self classServices at: className ifAbsent: [ 
		  ClassServices
			  at: className
			  put:
				  ((SpkScaffoldingClassServiceClient new name: className) 
					   registerWith: SpkConnectionProfile defaultConnection)
					  initializeService ]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> classServices [

	^ ClassServices ifNil: [ ClassServices := Dictionary new ]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> packageServiceNamed: packageName [

	^ self packageServices at: packageName ifAbsent: [ 
		  PackageServices
			  at: packageName
			  put:
				  ((SpkScaffoldingPackageServiceClient new name: packageName) 
					   registerWith: SpkConnectionProfile defaultConnection) initializeService]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> packageServices [

	^ PackageServices ifNil: [ PackageServices := Dictionary new ]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> projectServiceNamed: projectName [

	^ self projectServices at: projectName ifAbsent: [ 
		  ProjectServices
			  at: projectName
			  put:
				  ((SpkScaffoldingProjectServiceClient new name: projectName) 
					   registerWith: SpkConnectionProfile defaultConnection) initializeService]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> projectServices [

	^ ProjectServices ifNil: [ ProjectServices := Dictionary new ]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> releaseServices [

	BrowserService := nil. 
	ProjectServices := nil. 
	PackageServices := nil.
	ClassServices := nil. 
	AnsweringService := nil
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> abortTransaction [

	| promise |
	promise := self browserService abortTransaction.
	promise
		when: [ :scaffoldingService | 
			self class browserAnnouncer announce:
				SpkBrowserAbortAnnouncement new ]
		catch: [ :reason | self unexpectedCatch: reason ]
]

{ #category : 'services' }
SpkSparkyBrowserPresenter >> answeringService [

	^ self class answeringService
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> browseClassesFor: packageName [

	| promise |
	promise := (self packageServiceNamed: packageName) update.
	promise
		when: [ :scaffoldingService | 
			classList items: OrderedCollection new.
			classes := self extractServices: #classes from: scaffoldingService.
			self class browserAnnouncer announce:
				(SpkBrowserClassesAnnouncement new
					 name: packageName;
					 classes: classes) ]
		catch: [ :reason | self unexpectedCatch: reason ]
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> browsePackagesFor: projectName [

	| promise |
	promise := (self projectServiceNamed: projectName) update.
	promise
		when: [ :scaffoldingService | 
			self clearPackageList.
			self clearClassList.
			packages := self
				            extractServices: #packages
				            from: scaffoldingService.
			self class browserAnnouncer announce:
				(SpkBrowserPackagesAnnouncement new
					 name: projectName;
					 packages: packages) ]
		catch: [ :reason | self unexpectedCatch: reason ]
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> browseProjects [

	| promise |
	promise := self browserService updateProjects.
	promise
		when: [ :scaffoldingService | 
			self clearLists.
			projects := self
				            extractServices: #projects
				            from: scaffoldingService.
			self class browserAnnouncer announce:
				(SpkBrowserProjectsAnnouncement new projects: projects) ]
		catch: [ :reason | self unexpectedCatch: reason ]
]

{ #category : 'services' }
SpkSparkyBrowserPresenter >> browserService [

	^ self class browserService
]

{ #category : 'tabs' }
SpkSparkyBrowserPresenter >> classDefinitionPage [

	classDefinitionPresenter := self instantiate: SpkWorkspacePresenter.
	^ (SpNotebookPage
		   title: 'Class Definition'
		   icon: (self iconNamed: #class)
		   provider: [ classDefinitionPresenter ]) yourself
]

{ #category : 'services' }
SpkSparkyBrowserPresenter >> classServiceNamed: projectName [

	^ self class classServiceNamed: projectName
]

{ #category : 'events' }
SpkSparkyBrowserPresenter >> classesUpdated: announcement [

	(announcement isRelevantToPackage: self selectedPackage) ifFalse: [ 
		^ self ].
	SpkSparkyMergeListTool
		merge: announcement classes
		into: classList
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> clearAllBreaks [
]

{ #category : 'hot keys' }
SpkSparkyBrowserPresenter >> clearClassList [

	classList items: OrderedCollection new
]

{ #category : 'hot keys' }
SpkSparkyBrowserPresenter >> clearLists [

	self clearClassList.
	self clearPackageList.
	self clearProjectList
]

{ #category : 'hot keys' }
SpkSparkyBrowserPresenter >> clearPackageList [

	packageList items: OrderedCollection new
]

{ #category : 'hot keys' }
SpkSparkyBrowserPresenter >> clearProjectList [

	projectList items: OrderedCollection new
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> closeAndCleanup [

	self application close. 
	self class releaseServices.
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> commitTransaction [

	| promise |
	promise := self browserService commitTransaction.
	promise
		when: [ :scaffoldingService | 
			self class browserAnnouncer announce:
				SpkBrowserCommitAnnouncement new ]
		catch: [ :reason | self unexpectedCatch: reason ]
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> connectPresenters [

	super connectPresenters.
	projectList whenSelectionChangedDo: [ :selection | 
		selection ifNotNil: [ :sel | 
			sel selectedItem ifNotNil: [ :projectService | 
				self browsePackagesFor: projectService name ] ] ].
	packageList whenSelectionChangedDo: [ :selection | 
		selection ifNotNil: [ :sel | 
			sel selectedItem ifNotNil: [ :packageService | 
				self browseClassesFor: packageService name ] ] ].
	classList whenSelectionChangedDo: [ :selection | 
		selection ifNotNil: [ :sel | 
			sel selectedItem ifNotNil: [ :classService | 
				self updateClass ] ] ].
]

{ #category : 'hot keys' }
SpkSparkyBrowserPresenter >> extractServices: aspect from: scaffoldingService [

	| arrays |
	arrays := (scaffoldingService rowanService detect: [ :subarrays | 
		           subarrays first = aspect ]) last.
	^ (SpkSparkyRowanService aspectFor: aspect) servicesFromArrays:
		  arrays
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> findClass [

	| findPresenter |

	self updateClassNames.
	findPresenter := SparkyFind new start. 
	findPresenter items: allClassNames.
	findPresenter selectedItem
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initialize [

	super initialize.
	self initializeAnnouncements
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializeAnnouncements [

	self class browserAnnouncer
		when: SpkBrowserProjectsAnnouncement
		send: #projectsUpdated:
		to: self.
	self class browserAnnouncer
		when: SpkBrowserPackagesAnnouncement
		send: #packagesUpdated:
		to: self.
	self class browserAnnouncer
		when: SpkBrowserClassesAnnouncement
		send: #classesUpdated:
		to: self.
	SpkConnectionProfile profileAnnouncer
		when: SpkConnectionProfileDisconnectedAnnouncement
		send: #closeAndCleanup
		to: self.
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializeBrowserToolbar [

	toolbar := self newToolbar.
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Abort';
			 icon: (self iconNamed: #smallCancel);
			 help: 'Abort the transaction';
			 action: [ self abortTransaction ];
			 yourself).
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Commit';
			 icon: (self iconNamed: #smallSave);
			 help: 'Commit the transation';
			 action: [ self commitTransaction ];
			 yourself).
	self layout
		add: toolbar
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializeClassList: box [

	box add: (classList := self newTable beSingleSelection addColumn:
			              (SpImageTableColumn new
				               title: 'Classes';
				               evaluated: [ :classService | classService name ]))
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializeMainMenu [

	menu := self mainMenu.
	self layout
		add: menu
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializePackageList: box [

	box add: (packageList := self newTable beSingleSelection addColumn:
			                (SpImageTableColumn new
				                 title: 'Packages';
				                 evaluated: [ :packageService | 
					                 packageService name ]))
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializePresenters [

	| bigBox metaBox |
	super initializePresenters.
	self initializeMainMenu.
	self initializeBrowserToolbar.
	bigBox := SpkBoxLayout newTopToBottom.
	metaBox := SpkBoxLayout newLeftToRight.
	self initializeProjectList: metaBox.
	self initializePackageList: metaBox.
	self initializeClassList: metaBox.
	bigBox add: metaBox.
	self initializeSourceTabsIn: bigBox.
	self layout add: bigBox.
	self layout color: SpkConnectionListPresenter defaultColor
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializeProjectList: box [

	box add: (projectList := self newTable beSingleSelection addColumn:
			                (SpImageTableColumn new
				                 title: 'Projects';
				                 evaluated: [ :projectService | 
					                 projectService name ]))
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializeSourceTabsIn: box [

	sourceTabs := self newNotebook.
	sourceTabs addPage: self classDefinitionPage.
	sourceTabs addPage: self sourceCodePage. 
	box add: sourceTabs.
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparky Browser';
		initialExtent: 750 @ 700;
		whenClosedDo: [ 
			SpkConnectionProfile profileAnnouncer unsubscribe: self application.
			self class browserAnnouncer unsubscribe: self ].
	self shortCuts keysAndValuesDo: [ :key :value | 
		aWindowPresenter bindKeyCombination: key toAction: value ]
]

{ #category : 'menus' }
SpkSparkyBrowserPresenter >> mainMenu [

	| aMenu |
	aMenu := self newMenuBar addGroup: [ :group | 
		         group addItem: [ :item | 
			         item
				         name: 'Sparky';
				         subMenu: self sparkyMenu ] ].

	^ aMenu
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter >> menu [

	^ menu
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter >> menu: anObject [

	menu := anObject
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'menus' }
SpkSparkyBrowserPresenter >> overrideSourceCodeMenu [

	| menu |
	sourceCode overridingContextMenu contextMenu:
		(menu := SpMenuPresenter new addGroup: [ :group | 
			         group addItem: [ :item | 
				         item
					         name: 'Add Breakpoint';
					         icon: (self iconNamed: #stop);
					         action: [ self setBreakpoint ] ].
			         group addItem: [ :item | 
				         item
					         name: 'Clear All Breakpoints';
					         action: [ self clearAllBreaks ]
					          ] ]).
	menu addGroup: [ :group | 
		group addItem: [ :item | 
			item
				name: 'Save';
				action: [ self saveCode ];
				enabled: [ true ];
				shortcut: PharoShortcuts current acceptShortcut ] ].
	menu addGroup: [ :group | 
		group addItem: [ :item | 
			item
				name: 'Do It';
				action: [ sourceCode doIt ];
				shortcut: PharoShortcuts current doItShortcut ].
		group addItem: [ :item | 
			item
				name: 'Print It';
				action: [ sourceCode printIt ];
				shortcut: PharoShortcuts current printItShortcut ].
		group addItem: [ :item | 
			item
				name: 'Debug It';
				action: [ sourceCode debugIt ];
				shortcut: PharoShortcuts current debugItShortcut ] ]
]

{ #category : 'services' }
SpkSparkyBrowserPresenter >> packageServiceNamed: projectName [

	^ self class packageServiceNamed: projectName
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter >> packages [

	^ packages
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter >> packages: anObject [

	packages := anObject
]

{ #category : 'events' }
SpkSparkyBrowserPresenter >> packagesUpdated: announcement [

	(announcement isRelevantToProject: self selectedProject) ifFalse: [ 
		^ self ].
	SpkSparkyMergeListTool
		merge: announcement packages
		into: packageList
]

{ #category : 'services' }
SpkSparkyBrowserPresenter >> projectServiceNamed: projectName [

	^ self class projectServiceNamed: projectName
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter >> projects [

	^ projects
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter >> projects: anObject [

	projects := anObject
]

{ #category : 'events' }
SpkSparkyBrowserPresenter >> projectsUpdated: announcement [

	SpkSparkyMergeListTool
		merge: announcement projects
		into: projectList
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> saveCode [
]

{ #category : 'private accessing' }
SpkSparkyBrowserPresenter >> selectedClass [

	^ classList selection selectedItem
]

{ #category : 'private accessing' }
SpkSparkyBrowserPresenter >> selectedPackage [

	^ packageList selection selectedItem ifNotNil:[:item | item name]
]

{ #category : 'private accessing' }
SpkSparkyBrowserPresenter >> selectedProject [
	
	^ projectList selection selectedItem ifNotNil:[:item | item name]
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> setBreakpoint [
]

{ #category : 'hot keys' }
SpkSparkyBrowserPresenter >> shortCuts [

	| shortCuts |
	shortCuts := Dictionary new.
	shortCuts at: $f shift meta put: [ self findClass ].
	^ shortCuts
]

{ #category : 'tabs' }
SpkSparkyBrowserPresenter >> sourceCodePage [

	sourceCode := self instantiate: SpkCodePresenter.
	^ (SpNotebookPage
		   title: 'Method Source'
		   icon: (self iconNamed: #class)
		   provider: [ sourceCode ]) yourself
]

{ #category : 'menus' }
SpkSparkyBrowserPresenter >> sparkyMenu [

	| aMenu |
	aMenu := self newMenu addGroup: [ :group | 
		         group addItem: [ :item | 
			         item
				         name: 'Find Class ...';
				         shortcut: PharoShortcuts current findShortcut shift;
				         action: [ self findClass ] ] ].
	^ aMenu
]

{ #category : 'events' }
SpkSparkyBrowserPresenter >> unexpectedCatch: reason [

	^ Transcript
		  cr;
		  show: '=========';
		  cr;
		  show: 'UNEXPECTED CATCH: ' , reason printString;
		  cr;
		  show: DateAndTime now printString;
		  cr;
		  show: '=========';
		  yourself
]

{ #category : 'hot keys' }
SpkSparkyBrowserPresenter >> updateClass [


	| promise |
	promise := (self classServiceNamed: self selectedClass name) update.
	promise
		when: [ :scaffoldingService | 
				classDefinitionPresenter text: self selectedClass template ]
		catch: [ :reason | self unexpectedCatch: reason ]


]

{ #category : 'hot keys' }
SpkSparkyBrowserPresenter >> updateClassNames [

	| promise sem |
	promise := self answeringService allClassNames.
	sem := Semaphore new.
	promise
		when: [ :array | 
			allClassNames := array.
			sem signal ]
		catch: [ :reason | 
			self unexpectedCatch: reason.
			sem signal ].
	sem wait
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> updatePresenter [

	super updatePresenter.
	self browseProjects
]
