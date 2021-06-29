Class {
	#name : 'SpkSparkyBrowserPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'projects',
		'projectList',
		'packages',
		'packageList',
		'classList',
		'toolbar',
		'sourceCode',
		'sourceTabs',
		'classDefinitionPresenter',
		'menu',
		'allClassNames',
		'findClassMergeQueue',
		'methodList'
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

{ #category : 'constants' }
SpkSparkyBrowserPresenter >> classDefinitionTabIndex [

	"hopefully a temporary method"
	^1
]

{ #category : 'events' }
SpkSparkyBrowserPresenter >> classFound: announcement [

	announcement selectedItem ifNotNil: [:className | self findClassNamed: className ]
]

{ #category : 'events' }
SpkSparkyBrowserPresenter >> classSelected: classService [

	| scaffoldingService methods |
	scaffoldingService := (self classServiceNamed: classService name)
		                      updateSynchronously.
	classService updateFromArrays: scaffoldingService rowanService.
	methods := self extractServices: #methods from: scaffoldingService.
	self class browserAnnouncer announce:
		(SpkBrowserClassAnnouncement new
			 name: classService name;
			 methods: methods)
]

{ #category : 'services' }
SpkSparkyBrowserPresenter >> classServiceNamed: projectName [

	^ self class classServiceNamed: projectName
]

{ #category : 'events' }
SpkSparkyBrowserPresenter >> classUpdated: announcement [

	(announcement isRelevantToClass: self selectedClass name) ifFalse: [ 
		^ self ].
	SpkSparkyMergeListTool merge: announcement methods into: methodList.
	self updateClassDefinition: self selectedClass.
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
	self clearMethodList.
	self clearClassList.
	self clearPackageList.
	self clearProjectList
]

{ #category : 'hot keys' }
SpkSparkyBrowserPresenter >> clearMethodList [

	methodList items: OrderedCollection new
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
				self updatePackagesFor: projectService name ] ] ].
	packageList whenSelectionChangedDo: [ :selection | 
		selection ifNotNil: [ :sel | 
			sel selectedItem ifNotNil: [ :packageService | 
				self updateClassesFor: packageService name ] ] ].
	classList whenSelectionChangedDo: [ :selection | 
		selection ifNotNil: [ :sel | 
			sel selectedItem ifNotNil: [ :classService | 
				self classSelected: classService.
				 ] ] ].
	methodList whenSelectionChangedDo: [ :selection | 
		selection ifNotNil: [ :sel | 
			sel selectedItem ifNotNil: [ :methodService | 
				self methodSelected: methodService.
				 ] ] ].
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
	findPresenter announcer
		when: SpkBrowserFindAnnouncement
		send: #classFound:
		to: self.
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> findClassNamed: className [

	| promise |
	promise := (self classServiceNamed: className) update.
	promise
		when: [ :scaffoldingService | 
				| classService |
				classService := (SpkSparkyRowanClassService fromArrays: scaffoldingService rowanService).
				self findClassService: classService ]
		catch: [ :reason | self unexpectedCatch: reason ]

]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> findClassService: classService [
	classList items: Array new. 
	packageList items: Array new. 
	self selectClassProject: classService.
	self selectClassPackage: classService.
	self selectClassService: classService
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initialize [

	super initialize.
	self initializeAnnouncements.
	findClassMergeQueue := SharedQueue new. 
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
	self class browserAnnouncer
		when: SpkBrowserClassAnnouncement
		send: #classUpdated:
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
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Find Class';
			 icon: (self iconNamed: #smallFind);
			 help: 'Find a class';
			 action: [ self findClass ];
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
SpkSparkyBrowserPresenter >> initializeMethodList: box [

	box add: (methodList := self newTable beSingleSelection addColumn:
			              (SpImageTableColumn new
				               title: 'Methods';
				               evaluated: [ :methodService | methodService name ]))
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
	self initializeMethodList: metaBox. 
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
		initialExtent: 900 @ 700;
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

{ #category : 'events' }
SpkSparkyBrowserPresenter >> methodSelected: methodService [
	sourceCode text: methodService source.
	sourceTabs selectPageIndex: self methodSourceTabIndex. 
]

{ #category : 'constants' }
SpkSparkyBrowserPresenter >> methodSourceTabIndex [

	"hopefully a temporary method"
	^2
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
	SpkSparkyMergeListTool merge: announcement packages into: packageList.
	self class browserAnnouncer announce:
		SpkBrowserPackagesUpdatedAnnouncement new
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

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> selectClassPackage: classService [

	| packageName packageService index |
	[packageList items isEmpty] whileTrue:[(Delay forMilliseconds: 1) wait]. 
	packageName := classService packageName.
	packageService := packageList items detect: [ :item | 
		                  item name = packageName ].
	index := packageList items indexOf: packageService. 
	packageList selectIndex: index scrollToSelection: true.
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> selectClassProject: classService [

	| projectService |
	projectService := projectList items detect: [ :item | 
		                  item name = classService projectName ].
	projectList selectItems: (Array with: projectService)
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> selectClassService: classService [

	| index |
	[classList items isEmpty] whileTrue:[(Delay forMilliseconds: 1) wait]. 
	index := classList items indexOf: classService.
	Transcript cr; print: index; flush. 
	classList selectIndex: index scrollToSelection: true
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

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> updateClassDefinition: classService [

	classDefinitionPresenter text: classService template.
	sourceTabs selectPageIndex: self classDefinitionTabIndex
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

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> updateClassesFor: packageName [

	| scaffoldingService classes |
	scaffoldingService := (self packageServiceNamed: packageName)
		                      updateSynchronously.

	self clearClassList.
	self clearMethodList.
	classes := self extractServices: #classes from: scaffoldingService.
	self class browserAnnouncer announce:
		(SpkBrowserClassesAnnouncement new
			 name: packageName;
			 classes: classes)
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> updateMethodsFor: methods [

	SpkSparkyMergeListTool
		merge: methods
		into: methodList
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> updatePackagesFor: projectName [

	| scaffoldingService |
	scaffoldingService := (self projectServiceNamed: projectName)
		                      updateSynchronously.
	self clearPackageList.
	self clearClassList.
	self clearMethodList.
	packages := self extractServices: #packages from: scaffoldingService.
	self class browserAnnouncer announce:
		(SpkBrowserPackagesAnnouncement new
			 name: projectName;
			 packages: packages)
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> updatePresenter [

	super updatePresenter.
	self updateProjects
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> updateProjects [

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
