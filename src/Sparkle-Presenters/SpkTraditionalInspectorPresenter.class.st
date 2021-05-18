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

	| box |
	super initializePresenters.
	self initializeToolbar.
	box := SpkBoxLayout newLeftToRight.
	self initializeVariableList: box.
	self initializeVariablePane: box.
	self layout add: box.
	self layout color: SpkConnectionListPresenter defaultColor
]

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initializeToolbar [

	| toolbar |
	toolbar := self newToolbar.
	toolbar addItem: (SpToolbarButtonPresenter new
			 label: 'Inspect';
			 icon: (self iconNamed: #smallInspectIt);
			 help: 'Inspect nil for now';
			 action: [ self inspectVariableOop];
			 yourself).
	self layout
		add: toolbar
		withConstraints: [ :constraints | constraints height: 30 ]
]

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initializeVariableList: box [

	box add: (variableList := self newTable beSingleSelection addColumn:
			                 (SpImageTableColumn new evaluated: [ :assoc | 
				                  assoc key ])).
	self overrideVariableListMenu
]

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initializeVariablePane: box [

	box add: (variablePane := self newText)
]

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Sparkle Inspector';
		initialExtent: 500 @ 500
]

{ #category : 'actions' }
SpkTraditionalInspectorPresenter >> inspectOop [

	self inspectOop: oop
]

{ #category : 'actions' }
SpkTraditionalInspectorPresenter >> inspectOop: anOop [

	| inspectorService promise |
	inspectorService := SpkScaffoldingInspectorServiceClient new 
		                    registerWith:
		                    SpkConnectionProfile defaultConnection.
	promise := inspectorService inspect: anOop.
	promise
		when: [ :result | 
			objectDetails := result.
			self fillUpInspector.
			variableList selectIndex: 1 ]
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

{ #category : 'actions' }
SpkTraditionalInspectorPresenter >> inspectVariableOop [

	variableList selection selectedItem ifNotNil: [ :item | 
		item value isString ifFalse: [ SparkleTraditionalInspector on: item value ] ]
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

{ #category : 'initialization' }
SpkTraditionalInspectorPresenter >> overrideVariableListMenu [

	| menu |
	variableList contextMenu:
		(menu := SpMenuPresenter new addGroup: [ :group | 
			         group addItem: [ :item | 
				         item
					         name: 'Inspect';
					         icon: (self iconNamed: #glamorousInspect);
					         action: [ self inspectVariableOop ] ] ])
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
