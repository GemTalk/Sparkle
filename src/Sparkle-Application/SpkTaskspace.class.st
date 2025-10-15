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
		'presenterClassesForServiceTypes',
		'state',
		'initializationQueue'
	],
	#category : 'Sparkle-Application',
	#package : 'Sparkle-Application'
}

{ #category : 'activation' }
SpkTaskspace class >> applicationName [ 
	^ 'Sparkle Taskspace'
]

{ #category : 'instance creation' }
SpkTaskspace class >> forConnection: anRsrConnection [

	^ self new
		  initializeForConnection: anRsrConnection;
		  yourself
]

{ #category : 'transaction management' }
SpkTaskspace >> abortTransaction [

	^taskspaceService abortTransaction
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

{ #category : 'private' }
SpkTaskspace >> drainInitializationQueue [
	"Should be done after ensuring that no more messages will be added to the queue."

	| messages |
	messages := initializationQueue removeAll.
	messages do: [ :msg | msg sendTo: taskspaceService ]
]

{ #category : 'processing announcements' }
SpkTaskspace >> handleRespondedService: aService [

	aService class == SpkSuccessServiceClient
		ifFalse: [ self openWindowForService: aService ]
]

{ #category : 'initialization' }
SpkTaskspace >> initialize [

	super initialize.
	state := #new.
	initializationQueue := SpkSharedQueue new
]

{ #category : 'initialization' }
SpkTaskspace >> initializeForConnection: anRsrConnection [ 
	connection := anRsrConnection.
	state := #initializing.
	self initializeRegistryService.
	
	"Reply arrives via announcement and sets my taskspaceService"
	registryService newTaskspace. 
]

{ #category : 'initialization' }
SpkTaskspace >> initializeFromTaskspaceService: aTaskspaceService [
	"Open and initialize windows from the given service.
	This method runs in a non-UI thread."

	aTaskspaceService
		when: SpkNewExplorerAndPaneAnnouncement
		send: #receiveNewExplorerAndPaneAnnouncement:
		to: self.
	aTaskspaceService
		when: SpkTaskspaceResponseAnnouncement
		send: #receiveTaskspaceResponse:
		to: self.
	taskspaceService := aTaskspaceService.

	"Set state to connected and drain queue atomically to 
	prevent race condition."
	initializationQueue critical: [
		state := #connected.
		self drainInitializationQueue ]
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
		  at: SpkInspectorRawViewServiceClient
		  put: SpkInspectorFieldListView;
		  at: SpkInspectorSetViewServiceClient
		  put: SpkInspectorFieldListView;
		  at: SpkInspectorServiceClient put: SpkInspectorPane;
		  at: SpkProcessListServiceClient put: SpkProcessListPane;
		  at: SpkProcessTerminatedServiceClient
		  put: SpkProcessTerminatedPane;
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
SpkTaskspace >> newBrowser: pathString [

	| msg |
	msg := Message selector: #newBrowser: argument: pathString.
	self sendToService: msg
]

{ #category : 'actions' }
SpkTaskspace >> newEvaluator [

	"When first connecting, taskspaceService will be 
	nil since it's coming from the server."

	taskspaceService
		ifNotNil: [ :tService | 
			tService newEvaluatorExplorer
			"Reply comes via announcement" ]
		ifNil: [ "Defer until service comes in" needEvaluator := true ]
]

{ #category : 'actions' }
SpkTaskspace >> newProcessListExplorer [

	taskspaceService newProcessListExplorer
]

{ #category : 'running' }
SpkTaskspace >> openEmptyExplorer [

	"Answer a new empty explorer window with a new service as its model."

	| xServ |
	xServ := SpkExplorerServiceClient new registerWith: connection.
	^ self openWindowForService: xServ
]

{ #category : 'running' }
SpkTaskspace >> openExplorerForService: xService withPaneForService: pService [

	| explorer pane |
	explorer := self openWindowForService: xService.
	pane := explorer presenterForService: pService.
	explorer addInitialPane: pane.

	"For UI tests"
	self announce: (SpkExplorerOpenedAnnouncement new explorer: explorer)
]

{ #category : 'running' }
SpkTaskspace >> openWindowForService: anExplorerService [

	"Answer a new empty explorer window for the given service."

	| explorer |
	explorer := SpkExplorerWindow
		            newApplication: self
		            model: anExplorerService.
	explorer open.
	^ explorer
]

{ #category : 'initialization' }
SpkTaskspace >> presenterClassesForServiceTypes [

	^ presenterClassesForServiceTypes ifNil: [ 
		  self initializePresenterClassesForServiceTypes ]
]

{ #category : 'processing announcements' }
SpkTaskspace >> receiveNewExplorerAndPaneAnnouncement: announcement [

	self defer: [ 
		self
			openExplorerForService: announcement explorer
			withPaneForService: announcement pane ]
]

{ #category : 'processing announcements' }
SpkTaskspace >> receiveNewTaskspaceAnnouncement: anAnnouncement [
	"This initialization will not be in the UI thread"

	self initializeFromTaskspaceService: anAnnouncement taskspaceService
]

{ #category : 'processing announcements' }
SpkTaskspace >> receiveTaskspaceResponse: anAnnouncement [

	self defer: [ self handleRespondedService: anAnnouncement service ]
]

{ #category : 'actions' }
SpkTaskspace >> sendToService: aMessage [
	"Send the message to my TaskspaceService, if we think it's alive.
	If we're initializing we have to queue the message to be sent once the service is ready."

	"Check state and drain queue atomically to prevent race with #initializeFromTaskspaceService."

	initializationQueue critical: [
		state == #initializing ifTrue: [
			initializationQueue nextPut: aMessage.
			^ self ] ].
	state == #connected ifTrue: [ ^ aMessage sendTo: taskspaceService ].
	self error: 'The taskspace is in state ' , state
		, ' and does not have a live service.'
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
