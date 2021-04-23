Class {
	#name : 'SpkWorkspacePresenter',
	#superclass : 'SpkCodePresenter',
	#instVars : [
		'contextOop'
	],
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'accessing' }
SpkWorkspacePresenter >> contextOop [

	^ contextOop
]

{ #category : 'accessing' }
SpkWorkspacePresenter >> contextOop: anObject [

	contextOop := anObject
]

{ #category : 'actions' }
SpkWorkspacePresenter >> debuggerClosed [
]

{ #category : 'actions' }
SpkWorkspacePresenter >> doIt [

	| service debuggerClient promise announcement |
	announcement := self initializeResultReadyAnnouncement.
	service := SpkScaffoldingServiceClient new registerWith:
		           SpkConnectionProfile defaultConnection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new
		                  registerWith:
			                  SpkConnectionProfile defaultConnection;
		                  synchronize.
	promise := service
		           gsDebugger_07: self selectedText
		           usingDebugger: debuggerClient
		           contextOop: contextOop.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	promise
		when: [ :result | 
			SpkTraditionalDebuggerPresenter debuggerAnnouncer announce:
				(announcement result: result doitResult) ]
		catch: [ :reason | 
			Transcript
				cr;
				show: '=========';
				cr;
				show: 'UNEXPECTED CATCH: ' , reason printString;
				cr;
				show: DateAndTime now printString;
				cr;
				show: '=========';
				yourself ]
]

{ #category : 'initialization' }
SpkWorkspacePresenter >> initialize [
	super initialize.
	contextOop := 20. 
	self overrideTheContextMenu. 
]

{ #category : 'private' }
SpkWorkspacePresenter >> initializeResultReadyAnnouncement [

	| announcement interval insertionOffset |
	announcement := SpkDebuggerResultReadyAnnouncement new.
	interval := self selectionInterval.
	insertionOffset := interval isEmpty
		                   ifTrue: [ self cursorPositionIndex ]
		                   ifFalse: [ interval last ].
	announcement cursorPosition: insertionOffset.
	^ announcement
]

{ #category : 'initialization' }
SpkWorkspacePresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Workspace';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 400 @ 250;
		whenClosedDo: [ 
			SpkConnectionProfile profileAnnouncer unsubscribe: self ]
]

{ #category : 'menus' }
SpkWorkspacePresenter >> overrideTheContextMenu [
	self overridingContextMenu.
	self contextMenu: (SpMenuPresenter new addGroup: [ :group | 
			 group addItem: [ :item | 
				 item
					 name: 'Do It';
					 action: [ self doIt ];
					 shortcut: PharoShortcuts current doItShortcut ].
			 group addItem: [ :item | 
				 item
					 name: 'Print It';
					 action: [ self printIt ];
					 shortcut: PharoShortcuts current printItShortcut ] ])
]

{ #category : 'actions' }
SpkWorkspacePresenter >> printIt [

	SpkTraditionalDebuggerPresenter debuggerAnnouncer
		when: SpkDebuggerResultReadyAnnouncement
		send: #printIt:
		to: self.
	self doIt
]

{ #category : 'actions' }
SpkWorkspacePresenter >> printIt: announcement [

	| result insertionOffset resultString |
	result := announcement result.
	resultString := result asString.
	insertionOffset := announcement cursorPosition.
	  insertionOffset > self text size ifTrue: [ self text: self text, (String new: resultString size + 1) ]. 
 	self insert: resultString at: insertionOffset.
	self selectionInterval:
		(insertionOffset + 1 to: insertionOffset + resultString size).
	SpkTraditionalDebuggerPresenter debuggerAnnouncer unsubscribe: self
]
