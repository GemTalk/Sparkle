Class {
	#name : 'SpkScaffoldingInspectorServiceServer',
	#superclass : 'SpkScaffoldingInspectorService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'client actions' }
SpkScaffoldingInspectorServiceServer >> inspect: anOop [
	self rowanService: (RowanInspectorService new inspectOop: anOop).
]

{ #category : 'accessing' }
SpkScaffoldingInspectorServiceServer >> newRowanService [

	^RowanInspectorService new
]

{ #category : 'client actions' }
SpkScaffoldingInspectorServiceServer >> printLoadedVersions [
	| writeStream sortedProjects projectServices |
	sortedProjects := SortedCollection sortBlock: [ :a :b | a name < b name ].
	sortedProjects addAll: Rowan image loadedProjects.
	projectServices := sortedProjects
		collect: [ :project | RowanProjectService newNamed: project name ].
	writeStream := WriteStream on: String new.
	writeStream
		cr;
		nextPutAll: 'Server:'.
	projectServices
		do: [ :projectService | 
			writeStream
				cr;
				tab;
				nextPutAll: projectService name;
				tab;
				space;
				nextPutAll: (projectService branch ifNil: ['no branch']);
				tab;
				space;
				nextPutAll: (projectService sha ifNil: ['no sha'])].
	^ writeStream contents
]

{ #category : 'client actions' }
SpkScaffoldingInspectorServiceServer >> printOop: anOop [
	^ (Object _objectForOop: anOop) printString
]
