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

	^ remoteSelf doitResult wait
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
SpkScaffoldingServiceClient >> openDebuggerOnClient [

	'success' inspect
]
