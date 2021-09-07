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
		'explorerTools'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkTaskspaceTool class >> newDefault [

	^ self new
		  initializeForDefault;
		  yourself
]

{ #category : 'transaction management' }
SpkTaskspaceTool >> abortTransactionAnnouncing: anAnnouncement [
	"Abort the current transaction. Announce the change to those interested."

	| resultTool |
	resultTool := self performTransactionAction: [System abortTransaction].
	self announce: anAnnouncement.
	^resultTool
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

	explorerTools add: anExplorerTool.
	self announceNewExplorer: anExplorerTool
]

{ #category : 'announcing' }
SpkTaskspaceTool >> announceNewExplorer: anExplorerTool [

	| announcement |
	announcement := SpkNewExplorerToolAnnouncement new.
	announcement tool: anExplorerTool.
	self announce: announcement
]

{ #category : 'transaction management' }
SpkTaskspaceTool >> beginTransactionAnnouncing: anAnnouncement [
	"Begin a new transaction. Announce the change to those interested."

	| resultTool |
	resultTool := self performTransactionAction: [System beginTransaction].
	self announce: anAnnouncement.
	^resultTool
]

{ #category : 'transaction management' }
SpkTaskspaceTool >> commitTransactionAnnouncing: anAnnouncement [
	"Commit the current transaction. Announce the change to those interested."

	| resultTool |
	resultTool := self performTransactionAction: [System commit].
	self announce: anAnnouncement.
	^resultTool
]

{ #category : 'accessing' }
SpkTaskspaceTool >> explorerTools [

	^ explorerTools
]

{ #category : 'initialization' }
SpkTaskspaceTool >> initialize [

	super initialize.
	explorerTools := IdentitySet new.
	name := ''
]

{ #category : 'initialization' }
SpkTaskspaceTool >> initializeForDefault [

	self addDefaultExplorer
]

{ #category : 'instance creation' }
SpkTaskspaceTool >> newExplorerTool [

	^ SpkExplorerTool new
		  taskspaceTool: self;
		  yourself
]

{ #category : 'transaction management' }
SpkTaskspaceTool >> newProcessManager [
	"Create a new process to handle the asynchronous evaluation of an expression."

	^ SpkProcessLauncherAndManager new
		  taskspaceTool: self;
		  debuggerDebugAction: Processor activeProcess debugActionBlock;
		  processName: 'Evaluation';
		  processPriority: self evaluationPriority;
		  processBreakpointLevel: 1;
		  yourself
]

{ #category : 'transaction management' }
SpkTaskspaceTool >> performTransactionAction: aBlock [
	"Perform some transaction related action."

	| processBody processManager |
	processManager := self newProcessManager.
	processBody := [ 
	| resultObject |
	resultObject := aBlock
		ifCurtailed: [ 
			processManager
				returnValue: (SpkProcessTerminatedTool forProcess: GsProcess current) ].
			SpkSuccessTool new].

	^ processManager
		processBody: processBody;
		runProcess;
		waitForResult
]

{ #category : 'transaction management' }
SpkTaskspaceTool >> setAutomaticTransactionModeAnnouncing: anAnnouncement [
	"Abort the current transaction (implicit) and change to #autoBegin mode."

	| resultTool |
	resultTool := self performTransactionAction: [System transactionMode: #autoBegin].
	self announce: anAnnouncement.
	^resultTool
]

{ #category : 'transaction management' }
SpkTaskspaceTool >> setManualTransactionModeAnnouncing: anAnnouncement [
	"Abort the current transaction (implicit) and change to #manualBegin mode."

	| resultTool |
	resultTool := self performTransactionAction: [System transactionMode: #manualBegin].
	self announce: anAnnouncement.
	^resultTool
]
