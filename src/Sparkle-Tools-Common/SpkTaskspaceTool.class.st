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

{ #category : 'accessing' }
SpkTaskspaceTool >> explorerTools [

	^ explorerTools
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

{ #category : 'accessing' }
SpkTaskspaceTool >> newExplorerViewingAProcessList [
	"Returns a new ExplorerTool viewing a ProcessListTool"

	^SpkExplorerLayoutTool
		newInTaskspace: self
		viewing: self newProcessListTool
]

{ #category : 'refreshing' }
SpkTaskspaceTool >> synchronizeTaskspaceAnnouncing: anAnnouncement [

	self announce: anAnnouncement
]
