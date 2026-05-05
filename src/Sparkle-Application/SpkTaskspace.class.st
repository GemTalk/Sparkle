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
		'stateMonitor',
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

{ #category : 'actions' }
SpkTaskspace >> disconnect [

	stateMonitor critical: [
		state == #connected ifTrue: [
			self closeAllWindows.
			connection ifNotNil: [
				connection isOpen ifTrue: [ connection close ].
				connection := nil ].
			state := #dead ] ]
]

{ #category : 'private' }
SpkTaskspace >> drainInitializationQueue [
	"Should be done after ensuring that no more messages will be added to the queue.
	Sender must hold the stateMonitor."

	initializationQueue
		do: [ :msg | msg sendTo: taskspaceService ];
		removeAll
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

	"This monitor must be held during any accesses to 
	the init queue, or related state changes."
	stateMonitor := Monitor new.
	initializationQueue := OrderedCollection new
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
	stateMonitor critical: [
		state == #initializing ifFalse: [
			self error:
				'New taskspace service received when state was ' , state ].
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
		  at: SpkStopwatchServiceClient put: SpkStopwatchPane;
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

{ #category : 'testing' }
SpkTaskspace >> isConnected [

	^ stateMonitor critical: [
		  state == #connected and: [ connection isOpen ] ]
]

{ #category : 'actions' }
SpkTaskspace >> newBrowser: pathString [

	| msg |
	msg := Message selector: #newBrowser: argument: pathString.
	self sendToService: msg
]

{ #category : 'actions' }
SpkTaskspace >> newEvaluator [
	"Reply comes via announcement"

	| msg |
	msg := Message selector: #newEvaluatorExplorer.
	self sendToService: msg
]

{ #category : 'actions' }
SpkTaskspace >> newProcessListExplorer [
	"Reply comes via announcement"

	| msg |
	msg := Message selector: #newProcessListExplorer.
	self sendToService: msg
]

{ #category : 'instance creation' }
SpkTaskspace >> newStopwatch [
	"Open a new window with a new stopwatch in it."

	| explorerWindow stopwatchPane |
	explorerWindow := SpkExplorerWindow newApplication: self.
	stopwatchPane := SpkStopwatchPane owner: explorerWindow.
	explorerWindow
		addInitialPane: stopwatchPane;
		initializeServiceTree;
		initializeTreeOnServer;
		open
]

{ #category : 'instance creation' }
SpkTaskspace >> newTonelBrowser [
	"Have the user select a package directory, then
	Open a new window with browser on the Tonel files in that directory."

	| repository initialDir chosenDir msg |
	repository := IceRepository registeredRepositoryIncludingPackage:
		              self class package.
	initialDir := repository location parent.
	chosenDir := UIManager default
		             chooseDirectory: 'Choose a directory with Tonel files'
		             from: initialDir.

	msg := Message
		       selector: #newBrowser:
		       argument: chosenDir pathString.
	self sendToService: msg
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

	stateMonitor critical: [
		state == #initializing ifTrue: [
			initializationQueue add: aMessage.
			^ self ].
		state == #connected ifTrue: [ ^ aMessage sendTo: taskspaceService ] ].
	self error:
		'Attempt to send message to taskspace service while taskspace in state '
		, state
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

{ #category : 'accessing' }
SpkTaskspace >> taskspaceService [

	^ taskspaceService
]
