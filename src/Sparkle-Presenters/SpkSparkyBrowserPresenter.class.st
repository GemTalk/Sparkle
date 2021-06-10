Class {
	#name : 'SpkSparkyBrowserPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'browserService',
		'projects',
		'projectList',
		'packages',
		'packageList',
		'projectServices'
	],
	#classVars : [
		'BrowserAnnouncer',
		'BrowserService',
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
SpkSparkyBrowserPresenter class >> projectServiceNamed: projectName [

	^ self projectServices at: projectName ifAbsent: [ 
		  ProjectServices
			  at: projectName
			  put: (SpkScaffoldingProjectServiceClient new registerWith:
					   SpkConnectionProfile defaultConnection) ]
]

{ #category : 'accessing' }
SpkSparkyBrowserPresenter class >> projectServices [

	^ ProjectServices ifNil: [ Dictionary new ]
]

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> browsePackagesFor: projectName [

	| promise |
	promise := (self projectServiceNamed: projectName) updatePackages.
	promise
		when: [ :result | 
			self extractPackageServicesFrom: result.
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
		when: [ :result | 
			self extractProjectServicesFrom: result.
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

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> connectPresenters [

	super connectPresenters.
	projectList whenSelectionChangedDo: [ :selection | 
		selection ifNotNil: [ :sel | 
			sel selectedItem ifNotNil: [ :projectService | 
				self browsePackagesFor: projectService name ] ] ]
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> extractPackageServicesFrom: packageServiceArrays [

	| projectArrays |
	projectArrays := (packageServiceArrays rowanService detect: [ :arrays | 
		                  arrays first = #packages ]) last.
	projects := SpkSparkyRowanPackageService servicesFromArrays:
		            projectArrays
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> extractProjectServicesFrom: projectServiceArray [

	| projectArrays |
	projectArrays := (projectServiceArray rowanService detect: [ :arrays | 
		                  arrays first = #projects ]) last.
	projects := SpkSparkyRowanProjectService servicesFromArrays:
		            projectArrays
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initialize [

	super initialize.
	self initializeAnnouncements
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initializeAnnouncements [

	self class browserAnnouncer
		when: SpkBrowserProjectsAnnouncement
		send: #projectsUpdated:
		to: self.
	self class browserAnnouncer
		when: SpkBrowserPackagesAnnouncement
		send: #packagesUpdated:
		to: self
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initializePackageList: box [

	box add: (packageList := self newTable beSingleSelection addColumn:
			                (SpImageTableColumn new
				                 title: 'Packages';
				                 evaluated: [ :packageService | 
					                 packageService name ]))
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initializePresenters [

	| topBox metaBox |
	super initializePresenters.
	topBox := SpkBoxLayout newTopToBottom.
	metaBox := SpkBoxLayout newLeftToRight.
	self initializeProjectList: metaBox.
	self initializePackageList: metaBox. 
	topBox add: metaBox.
	self layout add: topBox.
	self layout color: SpkConnectionListPresenter defaultColor
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initializeProjectList: box [

	box add: (projectList := self newTable beSingleSelection addColumn:
			                (SpImageTableColumn new
				                 title: 'Projects';
				                 evaluated: [ :projectService | 
					                 projectService name ]))
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparky Browser';
		whenClosedDo: [ 
			self class browserAnnouncer unsubscribe: self ]
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> newLayout [

	^ SpkBoxLayout newVertical
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

{ #category : 'events' }
SpkSparkyBrowserPresenter >> projectsUpdated: announcement [

	projectList items = announcement projects ifFalse: [ 
		projectList items: announcement projects ]
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> updatePresenter [

	super updatePresenter.
	self browseProjects
]
