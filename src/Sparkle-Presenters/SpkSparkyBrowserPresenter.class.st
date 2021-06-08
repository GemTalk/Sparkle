Class {
	#name : 'SpkSparkyBrowserPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'browserService',
		'projects',
		'projectList'
	],
	#classVars : [
		'DebuggerAnnouncer'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkSparkyBrowserPresenter >> browseProjects [

	| promise |
	promise := self browserService updateProjects.
	promise
		when: [ :result | 
			projects := (result rowanService detect:[:arrays | arrays first = #projects]) last.
			projectList items: projects ]
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
					                 (projectService detect: [ :ea | 
							                  ea first = #name ]) last ]))
	"width: 150;"
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparky Browser'";
		initialExtent: 500 @ 500"
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> updatePresenter [

	super updatePresenter.
	self browseProjects
]
