"
Sparkle's main application.

A taskspace represents:
* The window (possibly windows) being used by a developer or more than one developer collaborating in real-time (e.g. pair-programming).
* The tools being displayed in the window(s).

Taskspaces have names. They can be persistent in GemStone, so that on login the windows in a taskspace can be reloaded and restored to something close to the state they were in when the developers' last session ended. After a reload, inspectors will be inspecting the same object they were, and code browsers will be showing the same code. Any open debuggers' processes will no longer be live processes.

Responsibilities of this class
* Provides API for login to an RSR session and either select an existing taskspace or create a new one.
* By default (class-side #open) opens a GUI to allow the user to do a login and select a taskspace or create a new one
* Be the Spec2 application for all Sparkle presenters
* Manage the RSR connection, especially initiating it and closing it
"
Class {
	#name : 'SpkTaskspace',
	#superclass : 'SpkApplication',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#instVars : [
		'connection',
		'registryService',
		'taskspaceService',
		'presenterClassesForServiceTypes'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'activation' }
SpkTaskspace class >> applicationName [ 
	^ 'Sparkle Taskspace'
]

{ #category : 'transaction management' }
SpkTaskspace >> abortTransaction [

	^taskspaceService abortTransaction
]

{ #category : 'initialization' }
SpkTaskspace >> addDefaultExplorer [

	taskspaceService addDefaultExplorer
]

{ #category : 'transaction management' }
SpkTaskspace >> beginTransaction [

	^taskspaceService beginTransaction
]

{ #category : 'transaction management' }
SpkTaskspace >> commitTransaction [

	^taskspaceService commitTransaction
]

{ #category : 'accessing' }
SpkTaskspace >> connection [
	^ connection
]

{ #category : 'accessing' }
SpkTaskspace >> connection: anObject [
	connection := anObject
]

{ #category : 'processing announcements' }
SpkTaskspace >> handleRespondedService: aService [

	aService class == SpkSuccessServiceClient
		ifFalse: [ self openWindowForService: aService ]
]

{ #category : 'running' }
SpkTaskspace >> initializeFromTaskspaceService: aTaskspaceService [

	"Open and initialize windows from the given service.
	This method runs in the UI thread."

	taskspaceService := aTaskspaceService.
	taskspaceService
		when: SpkNewExplorerAndPaneAnnouncement
		send: #receiveNewExplorerAndPaneAnnouncement:
		to: self.
	taskspaceService
		when: SpkTaskspaceResponseAnnouncement
		send: #receiveTaskspaceResponse:
		to: self
]

{ #category : 'initialization' }
SpkTaskspace >> initializePresenterClassesForServiceTypes [

	"This is only for pane presenters and services.
	Elements smaller than panes are handled by the panes themselves."

	presenterClassesForServiceTypes := IdentityDictionary new.
	^ presenterClassesForServiceTypes
		  at: SpkCompilationErrorServiceClient put: SpkCompilationErrorPane;
		  at: SpkDebuggerFrameServiceClient put: SpkDebuggerFramePane;
		  at: SpkDebuggerServiceClient put: SpkDebuggerPane;
		  at: SpkInspectorServiceClient put: SpkInspectorPane;
		  at: SpkProcessListServiceClient put: SpkProcessListPane;
		  at: SpkProcessTerminatedServiceClient put: SpkProcessTerminatedPane;
		  at: SpkRuntimeErrorServiceClient put: SpkRuntimeErrorPane;
		  yourself
]

{ #category : 'initialization' }
SpkTaskspace >> initializeRegistryService [

	"Note that the use of SpkTaskspaceAnnouncement means that there must be exactly one
	connection per SparkleTaskspace."

	registryService := SpkTaskspaceRegistryServiceClient new 
		                   registerWith: connection.
	registryService
		when: SpkNewTaskspaceAnnouncement
		send: #receiveNewTaskspaceAnnouncement:
		to: self.

	^ registryService
]

{ #category : 'actions' }
SpkTaskspace >> newEvaluator [

	taskspaceService newEvaluatorExplorer
	"Reply via announcement"
]

{ #category : 'actions' }
SpkTaskspace >> newProcessListExplorer [

	taskspaceService newProcessListExplorer
]

{ #category : 'running' }
SpkTaskspace >> openExplorerForService: xService withPaneForService: pService [

	| explorer column pane |
	explorer := SpkExplorerWindow newApplication: self model: xService.
	explorer openWithSpec.
	pane := explorer presenterForService: pService.
	pane coordinate: (SpkPaneCoordinate forVector: #( 0.5 )).

	column := explorer addColumn.
	column add: pane.

	"For UI tests"
	self announce: (SpkExplorerOpenedAnnouncement new explorer: explorer)
]

{ #category : 'initialization' }
SpkTaskspace >> openNewDefaultTaskspace [

	self registryService newDefaultTaskspace
	"Reply via TaskspaceLayoutAnnouncment"
]

{ #category : 'running' }
SpkTaskspace >> openWindowForService: anExplorerService [

	| explorer |
	explorer := SpkExplorerWindow
		            newApplication: self
		            model: anExplorerService.
	explorer openWithSpec.

	"For UI tests"
	self announce: (SpkExplorerOpenedAnnouncement new explorer: explorer)
]

{ #category : 'initialization' }
SpkTaskspace >> presenterClassesForServiceTypes [

	^ presenterClassesForServiceTypes ifNil: [ 
		  self initializePresenterClassesForServiceTypes ]
]

{ #category : 'as yet unclassified' }
SpkTaskspace >> receiveNewExplorerAndPaneAnnouncement: announcement [

	self defer: [ 
		self
			openExplorerForService: announcement explorerService
			withPaneForService: announcement paneService ]
]

{ #category : 'as yet unclassified' }
SpkTaskspace >> receiveNewExplorerAnnouncement: announcement [

	self defer: [ 
		self openWindowForService: announcement service ]
]

{ #category : 'processing announcements' }
SpkTaskspace >> receiveNewTaskspaceAnnouncement: anAnnouncement [

	self defer: [ 
		self initializeFromTaskspaceService: anAnnouncement taskspaceService ]
]

{ #category : 'processing announcements' }
SpkTaskspace >> receiveTaskspaceResponse: anAnnouncement [

	self defer: [ self handleRespondedService: anAnnouncement service ]
]

{ #category : 'accessing' }
SpkTaskspace >> registryService [

	^ registryService ifNil: [ self initializeRegistryService ]
]

{ #category : 'transaction management' }
SpkTaskspace >> setAutomaticTransactionMode [

	^taskspaceService setAutomaticTransactionMode
]

{ #category : 'transaction management' }
SpkTaskspace >> setManualTransactionMode [

	^taskspaceService setManualTransactionMode
]

{ #category : 'running' }
SpkTaskspace >> start [

	self shouldNotImplement
]
