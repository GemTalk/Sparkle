Class {
	#name : 'SpkTaskspaceLayoutTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerLayouts'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkTaskspaceLayoutTool class >> newDefault [

	^ self new
		  initializeForDefault;
		  yourself
]

{ #category : 'adding' }
SpkTaskspaceLayoutTool >> addExplorerLayout: anExplorerLayoutTool [

	explorerLayouts add: anExplorerLayoutTool
]

{ #category : 'accessing' }
SpkTaskspaceLayoutTool >> explorerLayouts [

	^ explorerLayouts
]

{ #category : 'initialization' }
SpkTaskspaceLayoutTool >> initialize [

	super initialize.
	explorerLayouts := IdentitySet new
]

{ #category : 'initialization' }
SpkTaskspaceLayoutTool >> initializeForDefault [

	self initializeForTool: SpkTaskspaceTool newDefault
]

{ #category : 'initialization' }
SpkTaskspaceLayoutTool >> initializeForTool: aTaskspaceTool [

	taskspaceTool := aTaskspaceTool.
	taskspaceTool layoutTool: self.
	explorerLayouts := taskspaceTool explorerTools collect: [ :each | 
		                   SpkExplorerLayoutTool new
			                   initializeForTool: each;
			                   yourself ]
]

{ #category : 'private' }
SpkTaskspaceLayoutTool >> newExplorerLayoutForPaneTool: paneTool [
	"XLTool -> CLTool -> PaneLayoutTool
	         \-> XTool  -------------------->\-> paneTool"

	"Assumes that paneTool has not been hooked 
	into the tool hierarchy."

	| xTool xlTool |
	xTool := SpkExplorerTool newInTaskspace: taskspaceTool.
	paneTool initializeDefaultInExplorer: xTool.
	xlTool := SpkExplorerLayoutTool newInTaskspace: taskspaceTool viewing: paneTool.
	self addExplorerLayout: xlTool.
	taskspaceTool addExplorer: xTool.
	^ xlTool
]

{ #category : 'new explorers' }
SpkTaskspaceLayoutTool >> newProcessListExplorerLayout [
	"XLTool -> CLTool -> PaneLayoutTool
	         \-> XTool  -------------------->\->ProcessListTool"

	^ self newExplorerLayoutForPaneTool: SpkProcessListTool new.
]
