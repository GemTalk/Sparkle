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
	explorerLayouts := Set new
]

{ #category : 'initialization' }
SpkTaskspaceLayoutTool >> initializeForDefault [

	self initializeForTool: SpkTaskspaceTool newDefault
]

{ #category : 'initialization' }
SpkTaskspaceLayoutTool >> initializeForTool: aTaskspaceTool [

	taskspaceTool := aTaskspaceTool.
	explorerLayouts := taskspaceTool explorerTools collect: [ :each | 
		                   SpkExplorerLayoutTool new
			                   initializeForTool: each;
			                   yourself ]
]
