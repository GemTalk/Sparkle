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

	"the value of the item is assumed to be a string or oop"

	super connectPresenters.
	variableList whenSelectionChangedDo: [ :selection | 
		selection selectedItem ifNotNil: [ :item | 
			item value isString
				ifTrue: [ variablePane text: item value ]
				ifFalse: [ variablePane text: (self printOop: item value) ] ] ]
]

{ #category : 'actions' }
SpkTraditionalInspectorPresenter >> fillUpInspector [

	| myself theOop objects items inspectorArray |
	inspectorArray := objectDetails rowanInspectorService. 
	myself := inspectorArray detect: [ :array | array first = #myself ].
	theOop := inspectorArray detect: [ :array | array first = #oop ].
	objects := inspectorArray detect: [ :array | array first = #objects ].
	items := OrderedCollection new.
	items add: 'self' -> myself last last.
	items add: '-.asOop' -> theOop last printString.
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

	box add:
		(variableList := self newTable beSingleSelection hideColumnHeaders 
			                 addColumn: (SpImageTableColumn new
					                  width: 150;
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

{ #category : 'actions' }
SpkTraditionalInspectorPresenter >> printOop: theOop [

	| inspectorService promise printString sem |
	inspectorService := SpkScaffoldingInspectorServiceClient new 
		                    registerWith:
		                    SpkConnectionProfile defaultConnection.
	promise := inspectorService printOop: theOop.
	sem := Semaphore new.
	promise
		when: [ :result | 
			printString := result.
			sem signal ]
		catch: [ :reason | 
			printString := 'Unexpected Error getting printString '
			               , reason printString.
			sem signal ].
	sem wait.
	^ printString
]
