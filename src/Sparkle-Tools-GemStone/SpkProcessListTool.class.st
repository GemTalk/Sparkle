Class {
	#name : 'SpkProcessListTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkProcessListTool >> explorerTool [

	^explorerTool
]

{ #category : 'accessing' }
SpkProcessListTool >> explorerTool: anExplorerTool [

	explorerTool := anExplorerTool
]

{ #category : 'inspecting' }
SpkProcessListTool >> newInspectorToolOn: anObject [

	^ explorerTool newInspectorToolOn: anObject
]

{ #category : 'accessing' }
SpkProcessListTool >> processTools [

	^ProcessorScheduler topazAllProcesses collect: [:proc | SpkProcessTool new process: proc; yourself]
]
