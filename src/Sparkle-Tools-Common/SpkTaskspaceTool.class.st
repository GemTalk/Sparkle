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
		'layoutTool',
		'explorerTools',
		'processRegistry'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkTaskspaceTool class >> newDefault [

	^ self new
		  initializeForDefault;
		  yourself
]

{ #category : 'initialization' }
SpkTaskspaceTool >> addDefaultExplorer [

	"The default initial taskspace has one default explorer."

	| explorer |
	explorer := self newExplorerTool
		            initializeForDefault;
		            yourself.

	self addExplorer: explorer.
	^ explorer
]

{ #category : 'adding' }
SpkTaskspaceTool >> addExplorer: anExplorerTool [
	explorerTools add: anExplorerTool
]

{ #category : 'adding' }
SpkTaskspaceTool >> announceNewExplorerLayoutForPaneTool: aPaneTool [
	layoutTool announceNewExplorerLayoutForPaneTool: aPaneTool
]

{ #category : 'actions' }
SpkTaskspaceTool >> debug: processToDebug explanation: anExplanation [
	"Dispatch the debug to the process's manager"

	| manager |
	manager := self
		managerForProcess: processToDebug
		ifAbsent: [ 
			self newProcessManager
				process: processToDebug;
				announceNextDebug: true;
				yourself ].
	manager debugWithExplanation: anExplanation
]

{ #category : 'accessing' }
SpkTaskspaceTool >> explorerTools [

	^ explorerTools
]

{ #category : 'initialization' }
SpkTaskspaceTool >> initializeForDefault [

	self addDefaultExplorer
]

{ #category : 'accessing' }
SpkTaskspaceTool >> layoutTool: object [
	layoutTool := object
]

{ #category : 'private' }
SpkTaskspaceTool >> managerForProcess: aProcess ifAbsent: absentBlock [
	"Answer the new or existing manager for the given process."

	^ processRegistry at: aProcess ifAbsent: absentBlock
]

{ #category : 'instance creation' }
SpkTaskspaceTool >> newExplorerTool [

	^ SpkExplorerTool new
		  taskspaceTool: self;
		  yourself
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
