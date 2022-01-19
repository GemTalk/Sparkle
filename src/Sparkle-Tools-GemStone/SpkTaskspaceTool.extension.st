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
	explorerTools := IdentitySet new.
	name := ''.
	processRegistry := SpkProcessRegistry new
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> newProcessLauncherWithBody: processBody
manager: processManager [

	^SpkProcessLauncher new
		processBreakpointLevel: 1;
		processPriority: self evaluationPriority;
		processName: 'Transaction Management';
		processBody: processBody;
		processManager: processManager;
		yourself
]

{ #category : '*Sparkle-Tools-GemStone' }
SpkTaskspaceTool >> newProcessListTool [

	^SpkProcessListTool new
		taskspaceTool: self;
		explorerTool:  (SpkExplorerTool newInTaskspace: self);
		yourself
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
	wasSuccessful := false.
	processBody := [ 
	| resultObject |
	resultObject := aBlock
		ifCurtailed: [ 
			processManager
				returnValue: (SpkProcessTerminatedTool forProcess: GsProcess current explorerTool: processManager explorerTool) ].
		wasSuccessful := true.
		nil "In the case of success, there is no defined return value."].
	processLauncher := self
		newProcessLauncherWithBody: processBody
		manager: processManager.

	processLauncher launch.
	processResult := processManager waitForResult.
	^wasSuccessful
		ifTrue: [SpkSuccessTool new]
		ifFalse:
			[SpkExplorerLayoutTool
				newInTaskspace: self
				viewing: processResult]
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
