Class {
	#name : 'SpkProcessListTool',
	#superclass : 'SpkTool',
	#instVars : [
		'explorerTool',
		'processTools'
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

{ #category : 'initializing' }
SpkProcessListTool >> initialize [

	super initialize.
	processTools := IdentityDictionary new
]

{ #category : 'inspecting' }
SpkProcessListTool >> newInspectorToolOn: anObject [

	^ explorerTool newInspectorToolOn: anObject
]

{ #category : 'enumerating' }
SpkProcessListTool >> processToolsDo: aBlock [

	self refreshProcessList.
	processTools valuesDo: aBlock
]

{ #category : 'processing announcements' }
SpkProcessListTool >> receiveExecutionAnnouncement: anAnnouncement [

	self announce: anAnnouncement
]

{ #category : 'refreshing' }
SpkProcessListTool >> refreshProcessList [

	| newProcessTools |
	newProcessTools := IdentityDictionary new.
	ProcessorScheduler topazAllProcesses
		do:
			[:process | | processTool |
			processTool := processTools at: process ifAbsent: [SpkProcessTool process: process].
			newProcessTools at: process put: processTool].
	processTools := newProcessTools
]

{ #category : 'refreshing' }
SpkProcessListTool >> synchronizeTaskspaceAnnouncing: anAnnouncement [

	taskspaceTool synchronizeTaskspaceAnnouncing: anAnnouncement
]

{ #category : 'accessing' }
SpkProcessListTool >> taskspaceTool: aTool [

	super taskspaceTool: aTool.
	taskspaceTool
		when: SpkExecutionAnnouncement
		send: #'receiveExecutionAnnouncement:'
		to: self
]
