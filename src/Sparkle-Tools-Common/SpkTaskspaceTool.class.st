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

	System abortTransaction.
	self announce: anAnnouncement
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

	System beginTransaction.
	self announce: anAnnouncement
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
SpkTaskspaceTool >> performTransactionAction: aBlock [
	"Perform some transaction related action."

	| processBody processManager |
	processManager := self newProcessLauncherAndManager.
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
