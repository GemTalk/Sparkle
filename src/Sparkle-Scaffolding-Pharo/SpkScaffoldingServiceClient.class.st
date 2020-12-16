Class {
	#name : 'SpkScaffoldingServiceClient',
	#superclass : 'SpkScaffoldingService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> doitExceptionDescription [

	^ remoteSelf doitExceptionDescription wait
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

	^ (remoteSelf doit_03: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doit_04: aString [

	^ (remoteSelf doit_04: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doit_05: aString [

	^ (remoteSelf doit_05: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> doit_06: aString [

	^ (remoteSelf doit_06: aString) wait
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> openDebuggerOnClient [

	self doitStack inspect
]

{ #category : 'debugger' }
SpkScaffoldingServiceClient >> openInspectorOnClient [

	self doitExceptionDescription inspect
]

{ #category : 'acccessing' }
SpkScaffoldingServiceClient >> processList [ 

	^ processList ifNil: [ processList := remoteSelf processList wait ]
]
