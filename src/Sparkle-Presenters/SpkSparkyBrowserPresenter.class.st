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
			projects := result.
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
]

{ #category : 'initialization' }
SpkSparkyBrowserPresenter >> initializeProjectList: box [

	box add:
		(projectList := self newTable addColumn: (SpImageTableColumn new
				                 title: 'Projects';
				                 evaluated: [ :projectService | 
					                 projectService detect: [ :ea | ea first = #name ] ]))
	"width: 150;"
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
