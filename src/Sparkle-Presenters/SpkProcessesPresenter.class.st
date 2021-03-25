Class {
	#name : 'SpkProcessesPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'processesList',
		'toolbar'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'actions' }
SpkProcessesPresenter >> debugProcess [

	"copied from pattern in SpkScaffoldingServiceClient"

	| client debuggerClient sem expressionResult |
	Transcript clear.
	client := SpkScaffoldingServiceClient new registerWith:
		          SpkConnectionProfile defaultConnection.
	debuggerClient := SpkScaffoldingDebuggerServiceClient new
		                  registerWith:
			                  SpkConnectionProfile defaultConnection;
		                  synchronize.
	Smalltalk at: #SPARKLE_DEBUGGER_SEMAPHORE put: Semaphore new.
	sem := Semaphore new.

	(client
		 debugProcessOop: processesList selection selectedItem first
		 usingDebugger: debuggerClient)
		when: [ :result | 
			expressionResult := result doitResult.

			sem signal ]
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
SpkProcessesPresenter >> initializePresenters [

	super initializePresenters.
	self initializeToolbar.
	self initializeProcessList.
	self layout color: Color purple muchLighter.
]

{ #category : 'initialization' }
SpkProcessesPresenter >> initializeProcessList [

	self layout add: (SpkBoxLayout newVertical
			 "add: (self newLabel label: 'Processes')
			 withConstraints: [ :constraints | constraints height: 25 ];"
			 add: (processesList := self newTable beSingleSelection
					                   sortingBlock: [ :a :b | a first < b first ];
					                   addColumn: (SpStringTableColumn new
							                    title: 'Oop';
							                    sortFunction: #first ascending;
							                    width: 100;
							                    evaluated: #first);
					                   addColumn: (SpStringTableColumn new
							                    title: 'Status';
							                    width: 100;
							                    sortFunction: #second ascending;
							                    evaluated: #second);
					                   addColumn: (SpStringTableColumn new
							                    title: 'Priority';
							                    evaluated: #last;
							                    sortFunction: #last ascending);
					                   items: OrderedCollection new;
					                   yourself);
			 yourself).
	self refreshProcesses
]

{ #category : 'initialization' }
SpkProcessesPresenter >> initializeToolbar [

	toolbar := self newToolbar
		           addItem: (SpToolbarButtonPresenter new
				            label: 'Debug';
				            icon: (self iconNamed: #smallDebug);
				            help: 'Debug a selected process';
				            action: [ self debugProcess ];
				            yourself);
		           addItem: (SpToolbarButtonPresenter new
				            label: 'Refresh';
				            icon: (self iconNamed: #smallUpdate);
				            help: 'Refresh process list';
				            action: [ self refreshProcesses ];
				            yourself);
		           yourself.
	self layout
		add: #toolbar
		withConstraints: [ :constraints | constraints height: 25 ]
]

{ #category : 'initialization' }
SpkProcessesPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Process Browser';
		borderColor: Color purple;
		borderWidth: 3;
		initialExtent: 400 @ 250;
		whenClosedDo: [ 
			SpkConnectionProfile profileAnnouncer unsubscribe: self ]
]

{ #category : 'accessing' }
SpkProcessesPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'actions' }
SpkProcessesPresenter >> refreshProcesses [

	| service result |
	service := SpkScaffoldingServiceClient new registerWith:
		           SpkConnectionProfile defaultConnection.
	result := service doit_01: 'Processor allProcesses asArray
				collect:[:process | 
						Array 
						with: process asOop
						with: process _statusString
						with: process priority ]'.
	processesList items: result
]
