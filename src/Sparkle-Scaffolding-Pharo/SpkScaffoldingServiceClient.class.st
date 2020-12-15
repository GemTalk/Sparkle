Class {
	#name : 'SpkScaffoldingServiceClient',
	#superclass : 'SpkScaffoldingService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> debugService [

	^ debugService ifNil: [ 
		  debugService := _connection serviceFor: #SpkScaffoldingService.
		  self _synchronize ]
]

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> doitResult [

	^ doitResult 
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doitStack [
	^ remoteSelf doitStack wait
]

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> doit_01: aString [

	^ (remoteSelf doit_01: aString) wait
]

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> doit_02: aString [

	^ (remoteSelf doit_02: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doit_03: aString [

	self debugService."prime the pump"
	^ (remoteSelf doit_03: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doit_04: aString [


	self debugService. "prime the pump"
	^ (remoteSelf doit_04: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doit_05: aString [

	self debugService. "prime the pump"
	^ (remoteSelf doit_05: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> openDebuggerOnClient [

	self doitStack inspect
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> openInspectorOnClient [

	'success' inspect
]

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> processList [ 

	^ processList ifNil: [ processList := remoteSelf processList wait ]
]
