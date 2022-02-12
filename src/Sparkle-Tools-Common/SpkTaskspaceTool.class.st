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
		'explorerTools',
		'processRegistry'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'private' }
SpkTaskspaceTool >> addExplorer: anExplorerTool [
	explorerTools add: anExplorerTool
]

{ #category : 'private' }
SpkTaskspaceTool >> announceNewExplorerForPaneTool: aPaneTool [

	| newExplorerTool announcement |
	newExplorerTool := self newExplorerForPaneTool: aPaneTool.
	announcement := SpkNewExplorerToolAnnouncement
		tool: newExplorerTool.
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

{ #category : 'accessing' }
SpkTaskspaceTool >> explorerTools [

	^ explorerTools
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

{ #category : 'private' }
SpkTaskspaceTool >> newExplorerForPaneTool: paneTool [
	"Assumes that paneTool has not been hooked 
	into the tool hierarchy."

	| xTool |
	xTool := SpkExplorerTool newInTaskspace: self.
	xTool addPane: paneTool.
	paneTool initializeDefaultInExplorer: xTool.
	self addExplorer: xTool.
	^ xTool
]

{ #category : 'instance creation' }
SpkTaskspaceTool >> newExplorerTool [
	| xTool |
	xTool := SpkExplorerTool new
		taskspaceTool: self;
		yourself.
	self addExplorer: xTool.
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

{ #category : 'adding' }
SpkTaskspaceTool >> newProcessListExplorer [
	^ self newExplorerForPaneTool: SpkProcessListTool new
]

{ #category : 'refreshing' }
SpkTaskspaceTool >> synchronizeTaskspaceAnnouncing: anAnnouncement [

	self announce: anAnnouncement
]
