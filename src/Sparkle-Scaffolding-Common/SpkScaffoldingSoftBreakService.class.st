Class {
	#name : 'SpkScaffoldingSoftBreakService',
	#superclass : 'SpkScaffoldingAbstractService',
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'accessing' }
SpkScaffoldingSoftBreakService class >> templateClassName [

	^ #SpkScaffoldingSoftBreakService
]

{ #category : 'public-events' }
SpkScaffoldingSoftBreakService >> configureProcess [
	"#configureProcess is called each time the framework calls into the framework to evaluate generic user code.
	#preUpdate and #postUpdate run in a configuration manner prescribed by the framework."

	super configureProcess.
	Processor activeProcess
		breakpointLevel: 0
]

{ #category : 'public-events' }
SpkScaffoldingSoftBreakService >> serviceSchedulingPriority [

	^Processor userInterruptPriority
]
