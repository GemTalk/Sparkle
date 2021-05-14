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
SpkWorkspacePresenter >> debugIt [

	self doItShouldPrint: false shouldDebug: true
]

{ #category : 'actions' }
SpkWorkspacePresenter >> debuggerClosed [
]

{ #category : 'actions' }
SpkWorkspacePresenter >> doIt [

	self doItShouldPrint: false shouldDebug: false
]

{ #category : 'actions' }
SpkWorkspacePresenter >> doItShouldPrint: shouldPrint shouldDebug: shouldDebug [

	| debuggerClient announcement promise service doItText |
	announcement := self initializeResultReadyAnnouncement.
	service := SpkScaffoldingServiceClient new registerWith:
		           SpkConnectionProfile defaultConnection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new
		                  registerWith:
			                  SpkConnectionProfile defaultConnection;
		                  synchronize.
	self selectedText isEmpty ifTrue: [ self selectLine ].
	doItText := (self selectedText copyWithout: Character null) trimmed.
	shouldDebug ifTrue: [ doItText := self insertSelfHaltIn: doItText ].
	promise := service
		           doIt: doItText
		           usingDebugger: debuggerClient
		           contextOop: contextOop
		           shouldPrint: shouldPrint.

	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	promise
		when: [ :result | 
			SpkTraditionalDebuggerPresenter debuggerAnnouncer announce:
				(announcement result: result doitResult) ]
		catch: [ :reason | 
			SpkTraditionalDebuggerPresenter debuggerAnnouncer unsubscribe: self ]
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

{ #category : 'private' }
SpkWorkspacePresenter >> insertSelfHaltIn: doItText [

	| ast selfHalt statements |
	ast := RBParser parseExpression: doItText.
	ast children isEmpty ifTrue: [ ^ 'self halt. ' , ast newSource ].
	selfHalt := RBParser parseExpression: 'self halt'.
	statements := ast statements asOrderedCollection.
	statements addFirst: selfHalt.
	(ast class canUnderstand: #statements:)
		ifTrue: [ ast statements: statements ]
		ifFalse: [ 
			ast := RBSequenceNode statements:
				       (OrderedCollection with: selfHalt with: ast) ]. "little hacky for now"
	selfHalt parent: ast.
	^ ast newSource
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
					 shortcut: PharoShortcuts current printItShortcut ].
			 group addItem: [ :item | 
				 item
					 name: 'Debug It';
					 action: [ self debugIt ];
					 shortcut: PharoShortcuts current debugItShortcut ] ])
]

{ #category : 'actions' }
SpkWorkspacePresenter >> printIt [

	SpkTraditionalDebuggerPresenter debuggerAnnouncer
		when: SpkDebuggerResultReadyAnnouncement
		send: #printIt:
		to: self.
	self doItShouldPrint: true shouldDebug: false
]

{ #category : 'actions' }
SpkWorkspacePresenter >> printIt: announcement [

	| insertionOffset resultString |
	resultString := announcement result.
	insertionOffset := announcement cursorPosition.
	insertionOffset > self text size ifTrue: [ 
		self text: self text , (String new: resultString size + 1) ].
	self insert: resultString at: insertionOffset.
	self selectionInterval:
		(insertionOffset + 1 to: insertionOffset + resultString size).
	SpkTraditionalDebuggerPresenter debuggerAnnouncer unsubscribe: self
]
