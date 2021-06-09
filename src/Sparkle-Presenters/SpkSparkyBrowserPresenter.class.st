Class {
	#name : 'SpkSparkyBrowserPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'browserService',
		'projects',
		'projectList'
	],
	#classVars : [
		'BrowserAnnouncer'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'class initialization' }
SpkSparkyBrowserPresenter class >> browserAnnouncer [

	^ BrowserAnnouncer ifNil: [ BrowserAnnouncer := Announcer new ]
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

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> browserService [

	browserService ifNil: [ 
		browserService := SpkScaffoldingBrowserServiceClient new 
			                    registerWith:
			                    SpkConnectionProfile defaultConnection ].
	^ browserService
]

{ #category : 'private actions' }
SpkSparkyBrowserPresenter >> extractProjectServicesFrom: result [

	| projectArrays |
	projectArrays := (result rowanService detect: [ :arrays | 
		                  arrays first = #projects ]) last.
	projects := SpkSparkyRowanProjectService servicesFromArrays:
		            projectArrays
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initialize [

	super initialize.
	self class browserAnnouncer
		when: SpkBrowserProjectsAnnouncement
		send: #projectsUpdated:
		to: self
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initializePresenters [

	| topBox |
	super initializePresenters.
	topBox := SpkBoxLayout newTopToBottom.
	self initializeProjectList: topBox. 
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
SpkSparkyBrowserPresenter >> projectsUpdated: announcement [

	projectList items = announcement projects ifFalse: [ 
		projectList items: announcement projects ]
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> updatePresenter [

	super updatePresenter.
	self browseProjects
]
