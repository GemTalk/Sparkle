Class {
	#name : 'SpkSparkyBrowserPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'projects',
		'projectList',
		'packages',
		'packageList',
		'classList',
		'classes'
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
		  ProjectServices
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
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> browseClassesFor: packageName [

	| promise |
	promise := (self packageServiceNamed: packageName) update.
	promise
		when: [ :scaffoldingService | 
			packages := self extractServices: #classes from: scaffoldingService.
			self class browserAnnouncer announce:
				(SpkBrowserClassesAnnouncement new classes: classes) ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself ]
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> browsePackagesFor: projectName [

	| promise |
	promise := (self projectServiceNamed: projectName) update.
	promise
		when: [ :scaffoldingService | 
			packages := self extractServices: #packages from: scaffoldingService.
			self class browserAnnouncer announce:
				(SpkBrowserPackagesAnnouncement new packages: packages) ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself ]
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> browseProjects [

	| promise |
	promise := self browserService updateProjects.
	promise
		when: [ :scaffoldingService | 
			projects := self extractServices: #projects from: scaffoldingService.
			self class browserAnnouncer announce:
				(SpkBrowserProjectsAnnouncement new projects: projects) ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself ]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter >> browserService [

	^ self class browserService
]

{ #category : 'events' }
SpkSparkyBrowserPresenter >> classesUpdated: announcement [

	classList items = announcement classes ifFalse: [ 
		classList items: announcement classes ]
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> closeAndCleanup [

	self application close. 
	self class releaseServices.
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

	packageList items = announcement packages ifFalse: [ 
		packageList items: announcement packages ]
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

	projectList items = announcement projects ifFalse: [ 
		projectList items: announcement projects ]
]

{ #category : 'initialization-release' }
SpkSparkyBrowserPresenter >> updatePresenter [

	super updatePresenter.
	self browseProjects
]
