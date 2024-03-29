Class {
	#name : 'SpkInspectorServiceServer',
	#superclass : 'SpkInspectorService',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkInspectorServiceServer >> initializeEvaluatorsFromTool [

	evaluators := OrderedCollection new.
	tool evaluatorTools do: [ :evaluatorTool | 
		evaluators add: (SpkEvaluatorServiceServer new
				 parentService: self;
				 initializeFromTool: evaluatorTool;
				 yourself) ]
]

{ #category : 'initialization' }
SpkInspectorServiceServer >> initializeFromTool: aTool [

	tool := aTool.
	tool
		when: SpkExecutionAnnouncement
		send: #receiveExecutionAnnouncement:
		to: self.
	self
		refreshFromTool;
		initializeEvaluatorsFromTool
]

{ #category : 'private' }
SpkInspectorServiceServer >> moveToExplorer: xServ [
	tool explorerTool: xServ tool.

	evaluators do: [ :each | each moveToExplorer: xServ ].
	views do: [ :each | each moveToExplorer: xServ ]
]

{ #category : 'actions' }
SpkInspectorServiceServer >> moveToNewExplorer [
	"Create a new explorer in my taskspace, move myself
	and my linked panes (visible and invisible) to it, 
	and answer the new explorer service."

	| xTool xServ |
	xTool := tool newExplorerTool.
	xServ := SpkServiceFactory serviceForTool: xTool.
	self moveToExplorer: xServ.
	^ xServ
]

{ #category : 'announcements' }
SpkInspectorServiceServer >> receiveExecutionAnnouncement: announcement [

	self refreshFromTool ifTrue: [ announcement addUpdatedService: self ]
]

{ #category : 'refreshing' }
SpkInspectorServiceServer >> refreshFromTool [

	| changed |
	changed := false.
	oop = tool oop ifFalse: [ changed := true ].
	classMembershipDescription = tool classMembershipDescription 
		ifFalse: [ changed := true ].
	selfDescription = tool selfDescription ifFalse: [ changed := true ].
	oop := tool oop.
	classMembershipDescription := tool classMembershipDescription.
	selfDescription := tool selfDescription.
	changed := changed | self refreshViews.
	^ changed
]

{ #category : 'refreshing' }
SpkInspectorServiceServer >> refreshViews [

	| changed viewServices viewTools |
	changed := false.
	viewServices := views.
	viewTools := tool views.
	views := viewTools collect: [ :viewTool | 
		         viewServices
			         detect: [ :service | 
				         service tool == viewTool
					         ifTrue: [ 
						         changed := changed | service refreshFromTool.
						         true ]
					         ifFalse: [ false ] ]
			         ifNone: [ SpkServiceFactory serviceForTool: viewTool ] ].
	^ changed or: [ viewServices ~= views ]
]

{ #category : 'accessing' }
SpkInspectorServiceServer >> tool [

	^ tool
]
