Class {
	#name : 'SpkStopwatchServiceClient',
	#superclass : 'SpkStopwatchService',
	#traits : 'SpkTModel + SpkTHierarchicalService',
	#classTraits : 'SpkTModel classTrait + SpkTHierarchicalService classTrait',
	#instVars : [
		'presenter'
	],
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'local actions' }
SpkStopwatchServiceClient >> pause [

	| promise |
	promise := remoteSelf pause.
	promise
		when: [ :ignored | self announceActionComplete ]
		catch: self defaultCatchBlock
]

{ #category : 'local actions' }
SpkStopwatchServiceClient >> reset [

	| promise |
	promise := remoteSelf reset.
	promise
		when: [ :ignored | self announceActionComplete ]
		catch: self defaultCatchBlock
]

{ #category : 'local actions' }
SpkStopwatchServiceClient >> run [

	| promise |
	promise := remoteSelf run.
	promise
		when: [ :ignored | self announceActionComplete ]
		catch: self defaultCatchBlock
]
