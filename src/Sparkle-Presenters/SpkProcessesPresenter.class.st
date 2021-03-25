Class {
	#name : 'SpkProcessesPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'processesList'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkProcessesPresenter >> initializePresenters [

	super initializePresenters.
	self layout add: (SpkBoxLayout newVertical
			 add: (self newLabel label: 'Processes')
			 withConstraints: [ :constraints | constraints height: 25 ];
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
	self initializeProcesses.
	self layout color: Color purple muchLighter.
	^ processesList 
]

{ #category : 'initialization' }
SpkProcessesPresenter >> initializeProcesses [

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
