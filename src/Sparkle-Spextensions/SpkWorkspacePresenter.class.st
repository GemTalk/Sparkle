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
SpkWorkspacePresenter >> doIt [

	| service debuggerClient promise doItResult semaphore |
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
	semaphore := Smalltalk
		             at: #SPARKLE_DEBUGGER_SEMAPHORE
		             put: Semaphore new.
	promise
		when: [ :result | 
			doItResult := result doitResult.
			semaphore signal ]
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
				yourself.
			semaphore signal ].
	semaphore wait.
	^ doItResult
]

{ #category : 'initialization' }
SpkWorkspacePresenter >> initialize [
	super initialize.
	contextOop := 20. 
	self overrideTheContextMenu. 
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
	Transcript show: 'overrideTheContextMenu'.
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

	| result |
	result := self doIt.
	self printIt: result
]

{ #category : 'actions' }
SpkWorkspacePresenter >> printIt: result [

	| interval insertionOffset resultString |
	resultString := result asString. 
	interval := self selectionInterval.
	insertionOffset := interval isEmpty
		                  ifTrue: [ self cursorPositionIndex ]
		                  ifFalse: [ interval last ].
	self insert: resultString at: insertionOffset + 1.
	self selectionInterval: (insertionOffset + 1 to: insertionOffset + resultString size + 2)
]
