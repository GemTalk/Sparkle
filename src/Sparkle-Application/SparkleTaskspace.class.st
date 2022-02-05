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
	#name : 'SparkleTaskspace',
	#superclass : 'SpkApplication',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#instVars : [
		'connection',
		'registryService',
		'layoutService',
		'taskspaceService',
		'presenterClassesForServiceTypes'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'activation' }
SparkleTaskspace class >> applicationName [ 
	^ 'Sparkle Taskspace'
]

{ #category : 'transaction management' }
SparkleTaskspace >> abortTransaction [

	^taskspaceService abortTransaction
]

{ #category : 'initialization' }
SparkleTaskspace >> addDefaultExplorer [

	layoutService addDefaultExplorer
]

{ #category : 'actions' }
SparkleTaskspace >> addProcessListExplorer [

	
	layoutService addProcessListExplorer
]

{ #category : 'transaction management' }
SparkleTaskspace >> beginTransaction [

	^taskspaceService beginTransaction
]

{ #category : 'transaction management' }
SparkleTaskspace >> commitTransaction [

	^taskspaceService commitTransaction
]

{ #category : 'accessing' }
SparkleTaskspace >> connection [
	^ connection
]

{ #category : 'accessing' }
SparkleTaskspace >> connection: anObject [
	connection := anObject
]

{ #category : 'processing announcements' }
SparkleTaskspace >> handleRespondedService: aService [

	aService class == SpkSuccessServiceClient
		ifFalse: [ self openWindowForService: aService ]
]

{ #category : 'initialization' }
SparkleTaskspace >> initializePresenterClassesForServiceTypes [

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
SparkleTaskspace >> initializeRegistryService [

	"Note that the use of SpkTaskspaceAnnouncement means that there must be exactly one
	connection per SparkleTaskspace."

	registryService := SpkTaskspaceRegistryServiceClient new 
		                   registerWith: connection.
	registryService
		when: SpkTaskspaceLayoutAnnouncement
		send: #receiveTaskspaceLayoutAnnouncement:
		to: self.

	^ registryService
]

{ #category : 'running' }
SparkleTaskspace >> openAllWindows [

	"Open and initialize windows from my service.
	This method runs in the UI thread."

	layoutService explorerLayoutServices do: [ :xlServ | 
		self openWindowForService: xlServ ]
]

{ #category : 'initialization' }
SparkleTaskspace >> openNewDefaultTaskspace [

	self registryService newDefaultTaskspaceLayout
	"Reply via TaskspaceLayoutAnnouncment"
]

{ #category : 'running' }
SparkleTaskspace >> openWindowForService: anExplorerLayoutService [

	| explorer |
	explorer := SpkExplorerWindow
		            newApplication: self
		            model: anExplorerLayoutService explorerService.
	explorer
		openWithSpec;
		initializeFromLayoutService: anExplorerLayoutService.
	self announce: (SpkExplorerOpenedAnnouncement new explorer: explorer)
]

{ #category : 'initialization' }
SparkleTaskspace >> presenterClassesForServiceTypes [

	^ presenterClassesForServiceTypes ifNil: [ 
		  self initializePresenterClassesForServiceTypes ]
]

{ #category : 'as yet unclassified' }
SparkleTaskspace >> receiveExplorerToOpenAnnouncement: announcement [

	self defer: [ 
		self openWindowForService: announcement service ]
]

{ #category : 'processing announcements' }
SparkleTaskspace >> receiveTaskspaceLayoutAnnouncement: anAnnouncement [

	self defer: [ 
		self restoreFromTaskspaceLayoutService:
			anAnnouncement taskspaceLayoutService ]
]

{ #category : 'processing announcements' }
SparkleTaskspace >> receiveTaskspaceResponse: anAnnouncement [

	self defer: [ self handleRespondedService: anAnnouncement service ]
]

{ #category : 'accessing' }
SparkleTaskspace >> registryService [

	^ registryService ifNil: [ self initializeRegistryService ]
]

{ #category : 'running' }
SparkleTaskspace >> restoreFromTaskspaceLayoutService: aLayoutService [

	"Open and initialize windows from the given service.
	This method runs in the UI thread."

	layoutService := aLayoutService.
	taskspaceService := layoutService taskspaceService.
	layoutService
		when: SpkExplorerToOpenAnnouncement
		send: #receiveExplorerToOpenAnnouncement:
		to: self.
	taskspaceService
		when: SpkTaskspaceResponseAnnouncement
		send: #receiveTaskspaceResponse:
		to: self.
	taskspaceService
		when: SpkExplorerToOpenAnnouncement
		send: #receiveExplorerToOpenAnnouncement:
		to: self.
	self openAllWindows
]

{ #category : 'transaction management' }
SparkleTaskspace >> setAutomaticTransactionMode [

	^taskspaceService setAutomaticTransactionMode
]

{ #category : 'transaction management' }
SparkleTaskspace >> setManualTransactionMode [

	^taskspaceService setManualTransactionMode
]

{ #category : 'running' }
SparkleTaskspace >> start [

	self shouldNotImplement
]
