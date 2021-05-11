Class {
	#name : 'SpkTraditionalInspectorPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'oop',
		'variableList',
		'variablePane',
		'objectDetails'
	],
	#classVars : [
		'DebuggerAnnouncer'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> connectPresenters [ 

	super connectPresenters.
	
]

{ #category : 'actions' }
SpkTraditionalInspectorPresenter >> fillUpInspector [

	| myself theOop objects items inspectorArray |
	inspectorArray := objectDetails rowanInspectorService. 
	myself := inspectorArray detect: [ :array | array first = #myself ].
	theOop := inspectorArray detect: [ :array | array first = #oop ].
	objects := inspectorArray detect: [ :array | array first = #objects ].
	items := OrderedCollection new.
	items add: 'self' -> myself last.
	items add: '-.asOop' -> theOop last.
	items addAll:
		(objects value last collect: [ :array | array first -> array last ]).
	variableList items: items
]

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initialize [

	super initialize.
	oop := 20. 
	
]

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initializePresenters [

	| toolbar box |
	super initializePresenters.
	toolbar := self newToolbar.
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Inspect';
			 icon: (self iconNamed: #smallInspectIt);
			 help: 'Inspect nil for now';
			 action: [ self inspect ];
			 yourself).
	self layout
		add: toolbar
		withConstraints: [ :constraints | constraints height: 30 ].
	box := SpkBoxLayout newLeftToRight. 
	self initializeVariableList: box. 
	self initializeVariablePane: box.
	self layout add: box
]

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initializeVariableList: box [

	box add: (variableList := self newTable beSingleSelection addColumn:
			                 (SpImageTableColumn new
				                  width: 150;
				                  title: 'Stuff';
				                  evaluated: [ :assoc | assoc key ]))
]

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initializeVariablePane: box [

	box add: (variablePane := self newText)
]

{ #category : 'actions' }
SpkTraditionalInspectorPresenter >> inspectOop [

	| inspectorService promise |
	inspectorService := SpkScaffoldingInspectorServiceClient new 
		                    registerWith:
		                    SpkConnectionProfile defaultConnection.
	promise := inspectorService inspect: oop.
	promise
		when: [ :result | 
			objectDetails := result.
			self fillUpInspector ]
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

{ #category : 'accessing' }
SpkTraditionalInspectorPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]

{ #category : 'accessing' }
SpkTraditionalInspectorPresenter >> oop [

	^ oop
]

{ #category : 'accessing' }
SpkTraditionalInspectorPresenter >> oop: anObject [

	oop := anObject
]
