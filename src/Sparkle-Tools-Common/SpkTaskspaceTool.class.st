"
A taskspace consists of some number of explorer windows containing some number of panes.

The TaskspaceTool's responsibility is keeping track of what explorers there are.

Its undo and redo operations have to do with the addition and removal of explorer tools.

A TaskspaceTool can be persistent, and can be named. If named, it can be recalled by name upon login.

Internal Representation and Key Implementation Points.

    Instance Variables
-	explorerTools:		<Set of SpkExplorerTool>
-	name: 					<String> The name by which this taskspace can be looked up.


    Implementation Points
"
Class {
	#name : 'SpkTaskspaceTool',
	#superclass : 'SpkToolWithUndoManager',
	#instVars : [
		'name',
		'processRegistry'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'private' }
SpkTaskspaceTool >> announceNewExplorerForPaneTool: pTool [
	| xTool announcement |
	xTool := self newExplorerTool.
	announcement := SpkNewExplorerAndPaneAnnouncement
		explorer: xTool
		pane: pTool.
	self announce: announcement
]

{ #category : 'actions' }
SpkTaskspaceTool >> debug: processToDebug explanation: anExplanation [
	"Dispatch the debug to the process's manager"

	| manager |
	manager := self managerForProcess: processToDebug.
	manager debugWithExplanation: anExplanation
]

{ #category : 'actions' }
SpkTaskspaceTool >> debugAndAnnounce: processToDebug explanation: anExplanation [
	"Dispatch the debug to the process's manager.
	Announces, so will always create a new explorer."

	(self managerForProcess: processToDebug)
		announceNextDebug: true;
		debugWithExplanation: anExplanation
]

{ #category : 'private' }
SpkTaskspaceTool >> managerForProcess: aProcess [
	"Answer a new or existing manager for the given process.
	New manager will announce, and so create a new explorer."

	^ self
		managerForProcess: aProcess
		ifAbsent: [ 
			self newProcessManager
				process: aProcess;
				announceNextDebug: true;
				yourself ]
]

{ #category : 'private' }
SpkTaskspaceTool >> managerForProcess: aProcess ifAbsent: absentBlock [
	"Answer the existing manager for the given process.
	If none, evaluate absentBlock."

	^ processRegistry at: aProcess ifAbsent: absentBlock
]

{ #category : 'instance creation' }
SpkTaskspaceTool >> newExplorerTool [
	| xTool |
	xTool := SpkExplorerTool new
		taskspaceTool: self;
		yourself.
	^ xTool
]

{ #category : 'actions' }
SpkTaskspaceTool >> newProcessLauncherWithBody: processBody
manager: processManager [

	^SpkProcessLauncher new
		processBreakpointLevel: 1;
		processPriority: self evaluationPriority;
		processName: 'Transaction Management';
		processBody: processBody;
		processManager: processManager;
		yourself
]

{ #category : 'refreshing' }
SpkTaskspaceTool >> synchronizeTaskspaceAnnouncing: anAnnouncement [

	self announce: anAnnouncement
]
