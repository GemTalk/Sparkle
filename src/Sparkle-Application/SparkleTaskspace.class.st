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
		'connection'
	],
	#category : 'Sparkle-Application'
}

{ #category : 'instance creation' }
SparkleTaskspace class >> openFromService: aTaskspaceService [

	^ self new
		  restoreTaskspace: aTaskspaceService;
		  yourself
]

{ #category : 'running' }
SparkleTaskspace >> restoreTaskspace: aTaskspaceService [

	"Open and initialize windows from the given service"

	aTaskspaceService explorersDo: [ :each | 
		(SpkExplorerWindow newApplication: self model: each) openWithSpec ]
]

{ #category : 'running' }
SparkleTaskspace >> start [

	self shouldNotImplement
]
