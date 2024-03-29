Class {
	#name : 'SpkProcessListTool',
	#superclass : 'SpkPaneTool',
	#instVars : [
		'processTools'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'initialization' }
SpkProcessListTool >> initialize [

	super initialize.
	processTools := IdentityDictionary new
]

{ #category : 'enumerating' }
SpkProcessListTool >> processToolsDo: aBlock [

	self refreshProcessList.
	processTools valuesDo: aBlock
]

{ #category : 'announcements' }
SpkProcessListTool >> receiveExecutionAnnouncement: anAnnouncement [

	self announce: anAnnouncement
]

{ #category : 'refreshing' }
SpkProcessListTool >> refreshProcessList [
	| newProcessTools |
	newProcessTools := IdentityDictionary new.
	ProcessorScheduler topazAllProcesses
		do: [ :process | 
			| processTool |
			processTool := processTools
				at: process
				ifAbsent: [ SpkProcessTool process: process taskspaceTool: taskspaceTool ].
			newProcessTools at: process put: processTool ].
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
