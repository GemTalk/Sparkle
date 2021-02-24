Class {
	#name : 'SpkToolTest',
	#superclass : 'SpkTestCase',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Tools-Common-Test'
}

{ #category : 'running' }
SpkToolTest >> newInspectorToolOn: anObject [

	| taskspaceTool explorerTool |
	taskspaceTool := SpkTaskspaceTool new.
	explorerTool := SpkExplorerTool new.
	tool := SpkInspectorTool new
		        inspectedObject: anObject;
		        taskspaceTool: taskspaceTool;
		        initializeViews;
		        explorerTool: explorerTool;
		        yourself
]
