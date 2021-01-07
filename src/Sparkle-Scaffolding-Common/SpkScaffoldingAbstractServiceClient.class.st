Class {
	#name : 'SpkScaffoldingAbstractServiceClient',
	#superclass : 'SpkScaffoldingService',
	#classVars : [
		'Connection'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'connections' }
SpkScaffoldingAbstractServiceClient class >> closeConnection [

	(Connection notNil and: [ Connection isOpen]) ifTrue: [ 
		Connection close ].
]

{ #category : 'connections' }
SpkScaffoldingAbstractServiceClient class >> connection [

	(Connection isNil or: [Connection isOpen not ]) ifTrue: [ self initiateConnection ].
	^Connection
]

{ #category : 'connections' }
SpkScaffoldingAbstractServiceClient class >> initiateConnection [

	| host port initiator |
	host := '0.0.0.0'.
	port := 7652.
	initiator := RsrInitiateConnection host: host port: port.
	^ Connection := initiator connect
]

{ #category : 'debugger' }
SpkScaffoldingAbstractServiceClient >> clearAllBreaks [
	"clear all breakpoints"

	^ remoteSelf clearAllBreaks wait
]

{ #category : 'acccessing' }
SpkScaffoldingAbstractServiceClient >> doitExceptionDescription [

	^ remoteSelf doitExceptionDescription wait
]

{ #category : 'acccessing' }
SpkScaffoldingAbstractServiceClient >> doitResult [

	^ doitResult 
]

{ #category : 'debugger' }
SpkScaffoldingAbstractServiceClient >> doitStack [
	^ remoteSelf doitStack wait
]

{ #category : 'acccessing' }
SpkScaffoldingAbstractServiceClient >> gcSuspendedProcesses [

	^ remoteSelf gcSuspendedProcesses wait
]

{ #category : 'debugger' }
SpkScaffoldingAbstractServiceClient >> gsDebugger_07: aString [

	^ remoteSelf gsDebugger_07: aString
]

{ #category : 'acccessing' }
SpkScaffoldingAbstractServiceClient >> processList [ 

	^ processList ifNil: [ processList := remoteSelf processList wait ]
]

{ #category : 'debugger' }
SpkScaffoldingAbstractServiceClient >> setBreakpointForClass: className meta: isMeta selector: selector atStepPoint: stepPoint [

	"Set a breakpoint that will be signalled to the GCI.
		Returns true to indicate success.  Otherwise returns a string describing the error."

	| res |
	(res := (remoteSelf
		         setBreakpointForClass: className
		meta: isMeta 
		         selector: selector
		         atStepPoint: stepPoint) wait) == true ifFalse: [ 
		self error: res ]
]

{ #category : 'debugger' }
SpkScaffoldingAbstractServiceClient >> setBreakpointForClass: className selector: selector atStepPoint: stepPoint [
	"Set a breakpoint that will be signalled to the GCI.
		Returns true to indicate success.  Otherwise returns a string describing the error."

| res |
	(res :=(remoteSelf
		   setBreakpointForClass: className
		   selector: selector
		   atStepPoint: stepPoint) wait) == true ifFalse: [self error: res]
]
