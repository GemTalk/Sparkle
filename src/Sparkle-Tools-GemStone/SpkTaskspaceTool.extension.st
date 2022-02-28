Extension { #name : 'SpkTaskspaceTool' }

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> abortTransactionAnnouncing: anAnnouncement [
	"Abort the current transaction. Announce the change to those interested."

	| resultTool |
	resultTool := self performTransactionAction: [System abortTransaction].
	self announce: anAnnouncement.
	^resultTool
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> beginTransactionAnnouncing: anAnnouncement [
	"Begin a new transaction. Announce the change to those interested."

	| resultTool |
	resultTool := self performTransactionAction: [System beginTransaction].
	self announce: anAnnouncement.
	^resultTool
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> commitTransactionAnnouncing: anAnnouncement [
	"Commit the current transaction. Announce the change to those interested."

	| resultTool |
	resultTool := self performTransactionAction: [System commit].
	self announce: anAnnouncement.
	^resultTool
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> initialize [
	super initialize.
	name := 'Default Taskspace'.
	processRegistry := SpkWeakKeyDictionary new
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> newProcessManager [
	"Create a new process to handle the asynchronous evaluation of an expression."

	^ SpkProcessManager new
		  taskspaceTool: self;
		  debuggerDebugAction: nil;
		  yourself
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> performTransactionAction: aBlock [
	"Perform some transaction related action."

	| processBody processManager processLauncher wasSuccessful processResult |
	processManager := self newProcessManager.
	processManager announceNextDebug: true.
	wasSuccessful := false.
	processBody := [ 
	| resultObject |
	resultObject := aBlock value.
	"	ifCurtailed: [ 
			processManager
				returnValue: (SpkProcessTerminatedTool forProcess: GsProcess current) ].
		wasSuccessful := true."
		nil "In the case of success, there is no defined return value."].
	processLauncher := self
		newProcessLauncherWithBody: processBody
		manager: processManager.

	processResult := processLauncher launch.
	^wasSuccessful
		ifTrue: [SpkSuccessTool new]
		ifFalse:
			[self announceNewExplorerForPaneTool: processResult]
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> registerManager: aProcessManager forProcess: aProcess [
	^ processRegistry
		at: aProcess
		ifPresent: [ :existingMgr | self error: 'Registering same process more than once.' ]
		ifAbsentPut: [ aProcessManager ]
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> setAutomaticTransactionModeAnnouncing: anAnnouncement [
	"Abort the current transaction (implicit) and change to #autoBegin mode."

	| resultTool |
	resultTool := self performTransactionAction: [System transactionMode: #autoBegin].
	self announce: anAnnouncement.
	^resultTool
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> setManualTransactionModeAnnouncing: anAnnouncement [
	"Abort the current transaction (implicit) and change to #manualBegin mode."

	| resultTool |
	resultTool := self performTransactionAction: [System transactionMode: #manualBegin].
	self announce: anAnnouncement.
	^resultTool
]