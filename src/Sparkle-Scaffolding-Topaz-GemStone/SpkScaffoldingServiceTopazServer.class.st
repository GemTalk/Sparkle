Class {
	#name : 'SpkScaffoldingServiceTopazServer',
	#superclass : 'SpkScaffoldingServiceServer',
	#category : 'Sparkle-Scaffolding-Topaz-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingServiceTopazServer class >> clientClassName [
	^ #'SpkScaffoldingServiceTopazClient'
]

{ #category : 'service loop' }
SpkScaffoldingServiceTopazServer class >> port [
	^ 7653
]

{ #category : 'debugger' }
SpkScaffoldingServiceTopazServer >> debugService [
	^ debugService
		ifNil: [ 
			debugService := self class new
				registerWith: self _connection;
				yourself ]
]

{ #category : 'debugger' }
SpkScaffoldingServiceTopazServer >> gsDebugger_04: aString [
	"
		Populate the doitStack iv with a process service and frame services representing the debugger meta data
	"
	doitResult := [ aString evaluate ]
		on: Halt , Error
		do: [ :ex | 
			| mon |
			debugProcess := GsProcess _current.
			mon := [ self openDebuggerOnClientWithProcessService: ex ]
				forkAt: Processor userInterruptPriority.
			debugProcess suspend.
			"open question: once I suspend the process, how do I arrange for the doitResult to get set the final result of the process?"
			nil ]
]
