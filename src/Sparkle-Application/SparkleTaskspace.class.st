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

{ #category : 'accessing' }
SparkleTaskspace >> connection [
	^ connection
]

{ #category : 'accessing' }
SparkleTaskspace >> connection: anObject [
	connection := anObject
]

{ #category : 'initialization' }
SparkleTaskspace >> initializePresenterClassesForServiceTypes [

	"This is only for pane presenters and services."

	presenterClassesForServiceTypes := IdentityDictionary new.
	^ presenterClassesForServiceTypes
		  at: SpkCompilationErrorServiceClient put: SpkCompilationErrorPane;
		  at: SpkInspectorServiceClient put: SpkInspectorPane;
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

	"Open and initialize windows from my service"

	layoutService explorerLayoutServices do: [ :xlServ | 
		| explorer |
		explorer := SpkExplorerWindow
			            newApplication: self
			            model: xlServ explorerService.
		explorer
			openWithSpec;
			initializeFromLayoutService: xlServ.
		self announce:
			(SpkExplorerOpenedAnnouncement new explorer: explorer) ]
]

{ #category : 'initialization' }
SparkleTaskspace >> openNewDefaultTaskspace [

	self registryService newDefaultTaskspaceLayout
	"Reply via TaskspaceLayoutAnnouncment"
]

{ #category : 'initialization' }
SparkleTaskspace >> presenterClassesForServiceTypes [

	^ presenterClassesForServiceTypes ifNil: [ 
		  self initializePresenterClassesForServiceTypes ]
]

{ #category : 'initialization' }
SparkleTaskspace >> receiveTaskspaceLayoutAnnouncement: anAnnouncement [

	self defer: [ 
		self restoreFromTaskspaceLayoutService:
			anAnnouncement taskspaceLayoutService ]
]

{ #category : 'accessing' }
SparkleTaskspace >> registryService [

	^ registryService ifNil: [ self initializeRegistryService ]
]

{ #category : 'running' }
SparkleTaskspace >> restoreFromTaskspaceLayoutService: aLayoutService [

	"Open and initialize windows from the given service"

	layoutService := aLayoutService.
	taskspaceService := layoutService taskspaceService.
	self openAllWindows
]

{ #category : 'running' }
SparkleTaskspace >> start [

	self shouldNotImplement
]
