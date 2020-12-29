"
Pretty much copied from SpkScaffoldingServiceClient on Pharo
"
Class {
	#name : 'SpkScaffoldingTopazServiceClient',
	#superclass : 'SpkScaffoldingTopazService',
	#classVars : [
		'Connection'
	],
	#category : 'Sparkle-Scaffolding-Topaz-GemStone'
}

{ #category : 'connections' }
SpkScaffoldingTopazServiceClient class >> closeConnection [

	(Connection notNil and: [ Connection isOpen ]) ifTrue: [ 
		Connection close ]
]

{ #category : 'connections' }
SpkScaffoldingTopazServiceClient class >> connection [

	(Connection isNil or: [ Connection isOpen not ]) ifTrue: [ 
		self initiateConnection ].
	^ Connection
]

{ #category : 'examples' }
SpkScaffoldingTopazServiceClient class >> debugger_05: listenForDebugConnection [
	"
		1. execute expression
		2. catch the halt simulate opening a debugger - display stack and gci continue
		3. expect to get 7 back
	"

	self
		executeExpression_05: '(3+4) halt'
		listentFroDebugConnection: listenForDebugConnection
]

{ #category : 'examples' }
SpkScaffoldingTopazServiceClient class >> executeExpression_05: expression listentFroDebugConnection: listenForDebugConnection [

	| service |
	listenForDebugConnection
		ifTrue: [ System listenForDebugConnection ].
	service := (Rowan globalNamed: self clientClassName) new
		registerWith: self connection;
		yourself.
	GsFile gciLogServer: 'Evaluating ' , expression printString.
	(service gsDebugger_04: expression)
		when: [ :result | 
			"expect result to be 7"
			result doitResult == 7
				ifFalse: [ self error: 'Expected expression result to be 7' ].
			GsFile gciLogServer: 'expression result -> ' , result doitResult printString ]
		catch: [ :reason | GsFile gciLogServer: 'catch - >' , reason printString ].
	GsFile gciLogServer: '--- delay'.
	(Delay forSeconds: 5) wait.
	GsFile
		gciLogServer:
			'--- exit ----------------------------------------------------------------'
]

{ #category : 'examples' }
SpkScaffoldingTopazServiceClient class >> expected_05: listenForDebugConnection [
	"
		1. execute expression
		2. expect to get 7 as result "

	self
		executeExpression_05: '3+4'
		listentFroDebugConnection: listenForDebugConnection
]

{ #category : 'connections' }
SpkScaffoldingTopazServiceClient class >> initiateConnection [

	| host port initiator |
	host := '127.0.0.1'.
	port := self port.
	initiator := RsrInitiateConnection host: host port: port.
	^ Connection := initiator connect
]

{ #category : 'connections' }
SpkScaffoldingTopazServiceClient class >> port [
	^ 7653
]

{ #category : 'accessing' }
SpkScaffoldingTopazServiceClient >> doitExceptionDescription [

	^ remoteSelf doitExceptionDescription wait
]

{ #category : 'accessing' }
SpkScaffoldingTopazServiceClient >> doitResult [

	^ remoteSelf doitResult wait
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceClient >> gsDebugger_04: aString [

	^ remoteSelf gsDebugger_04: aString
]

{ #category : 'debugger' }
SpkScaffoldingTopazServiceClient >> openDebuggerOnClient [
	| processService stack |
	processService := self doitStack.
	GsFile
		gciLogServer:
			'simulate opening debugger on process (' , processService printString
				, ') ... with stack: '.
	stack := processService rowanFrameServices.
	1 to: stack size do: [ :index | 
		| frame |
		frame := stack at: index.
		GsFile gciLogServer: '  ' , index printString , '. ' , frame label ].
	GsFile gciLogServer: '---simulate continue'.
	processService resume	"want to tell the process to resume with the same semantics as GCI continue"
]
