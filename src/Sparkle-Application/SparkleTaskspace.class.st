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
	#instVars : [
		'connection',
		'registryService',
		'taskspaceService',
		'presenterClassesForServiceTypes'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'activation' }
SparkleTaskspace class >> applicationName [ 
	^ 'Sparkle Taskspace'
]

{ #category : 'instance creation' }
SparkleTaskspace class >> openFromService: aTaskspaceService [

	self flag: 'This method is probably obsolete.'.

	^ self new
		  restoreTaskspace: aTaskspaceService;
		  yourself
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
SparkleTaskspace >> fetchDefaultService [

	self registryService defaultTaskspaceService
]

{ #category : 'initialization' }
SparkleTaskspace >> initializeAsDefault [

	self flag: 'Obsolete method'.
	self registryService defaultTaskspaceService
]

{ #category : 'initialization' }
SparkleTaskspace >> initializeForName: aName [

	self flag: 'incomplete'.

	self registryService taskspaceServiceNamed: aName
]

{ #category : 'initialization' }
SparkleTaskspace >> initializePresenterClassesForServiceTypes [

	"This is only for pane presenters and services."

	presenterClassesForServiceTypes := IdentityDictionary new.
	^ presenterClassesForServiceTypes
		  at: SpkInspectorServiceClient put: SpkInspectorPane;
		  yourself
]

{ #category : 'initialization' }
SparkleTaskspace >> initializeRegistryService [

	"Note that the use of SpkTaskspaceAnnouncement means that there must be exactly one
	connectino per SparkleTaskspace."

	registryService := connection serviceFor:
		                   #SpkTaskspaceRegistryService.
	registryService
		when: SpkTaskspaceAnnouncement
		send: #taskspaceArrived:
		to: self.

	^ registryService
]

{ #category : 'running' }
SparkleTaskspace >> openAllWindows [

	"Open and initialize windows from my service"

	taskspaceService explorersDo: [ :each | 
		(SpkExplorerWindow newApplication: self model: each) openWithSpec ]
]

{ #category : 'initialization' }
SparkleTaskspace >> presenterClassesForServiceTypes [

	^ presenterClassesForServiceTypes ifNil: [ 
		  self initializePresenterClassesForServiceTypes ]
]

{ #category : 'accessing' }
SparkleTaskspace >> registryService [

	^ registryService ifNil: [ self initializeRegistryService ]
]

{ #category : 'running' }
SparkleTaskspace >> restoreTaskspace: aTaskspaceService [

	"Open and initialize windows from the given service"

	taskspaceService := aTaskspaceService.
	self openAllWindows
]

{ #category : 'running' }
SparkleTaskspace >> start [

	self shouldNotImplement
]

{ #category : 'initialization' }
SparkleTaskspace >> taskspaceArrived: anAnnouncement [

	self defer: [ self restoreTaskspace: anAnnouncement taskspaceService ]
]
