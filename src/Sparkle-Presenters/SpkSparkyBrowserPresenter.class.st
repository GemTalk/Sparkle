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
		'toolbar'
	],
	#classVars : [
		'BrowserAnnouncer',
		'BrowserService',
		'PackageServices',
		'ProjectServices'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

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
			packageList items: OrderedCollection new.
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
			projectList items: OrderedCollection new.
			projects := self
				            extractServices: #projects
				            from: scaffoldingService.
			self class browserAnnouncer announce:
				(SpkBrowserProjectsAnnouncement new projects: projects) ]
		catch: [ :reason | self unexpectedCatch: reason ]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter >> browserService [

	^ self class browserService
]

{ #category : 'events' }
SpkSparkyBrowserPresenter >> classesUpdated: announcement [

	(announcement isRelevantToPackage: self selectedPackage) ifFalse: [ 
		^ self ].
	SpkSparkyMergeListTool
		merge: announcement classes
		into: classList
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
				self browseClassesFor: packageService name ] ] ]
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> extractServices: aspect from: scaffoldingService [

	| arrays |
	arrays := (scaffoldingService rowanService detect: [ :subarrays | 
		           subarrays first = aspect ]) last.
	^ (SpkSparkyRowanService aspectFor: aspect) servicesFromArrays:
		  arrays
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
SpkSparkyBrowserPresenter >> initializePackageList: box [

	box add: (packageList := self newTable beSingleSelection addColumn:
			                (SpImageTableColumn new
				                 title: 'Packages';
				                 evaluated: [ :packageService | 
					                 packageService name ]))
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> initializePresenters [

	| topBox metaBox |
	super initializePresenters.
	self initializeBrowserToolbar.
	topBox := SpkBoxLayout newTopToBottom.
	metaBox := SpkBoxLayout newLeftToRight.
	self initializeProjectList: metaBox.
	self initializePackageList: metaBox.
	self initializeClassList: metaBox.
	topBox add: metaBox.
	self layout add: topBox.
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
SpkSparkyBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparky Browser';
		initialExtent: 750 @ 300;
		whenClosedDo: [ 
			SpkConnectionProfile profileAnnouncer unsubscribe: self application.
			self class browserAnnouncer unsubscribe: self ]
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
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

{ #category : 'private accessing' }
SpkSparkyBrowserPresenter >> selectedPackage [

	^ packageList selection selectedItem ifNotNil:[:item | item name]
]

{ #category : 'private accessing' }
SpkSparkyBrowserPresenter >> selectedProject [
	
	^ projectList selection selectedItem ifNotNil:[:item | item name]
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

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> updatePresenter [

	super updatePresenter.
	self browseProjects
]
