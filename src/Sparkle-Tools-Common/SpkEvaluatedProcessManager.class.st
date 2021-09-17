Class {
	#name : 'SpkEvaluatedProcessManager',
	#superclass : 'SpkProcessLauncherAndManager',
	#instVars : [
		'explorerTool'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkEvaluatedProcessManager >> explorerTool [

	^explorerTool
]

{ #category : 'accessing' }
SpkEvaluatedProcessManager >> explorerTool: anExplorerTool [

	explorerTool := anExplorerTool
]
