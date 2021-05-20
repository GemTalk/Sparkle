Class {
	#name : 'SpkScaffoldingInspectorServiceServer',
	#superclass : 'SpkScaffoldingInspectorService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'client actions' }
SpkScaffoldingInspectorServiceServer >> inspect: anOop [
	| serverInspectorService instVarNames |
	serverInspectorService := RowanInspectorService new inspectOop: anOop.
	rowanInspectorService := Array new.
	instVarNames := serverInspectorService class allInstVarNames.
	1 to: instVarNames size do: [ :index | 
		(instVarNames at: index) = #'objects'
			ifTrue: [ 
				| objectsArray |
				objectsArray := Array new.
				(serverInspectorService instVarAt: index)
					do: [ :assoc | objectsArray add: (self prepareObjectForReplication: assoc) ].
				rowanInspectorService
					add: (Array with: (instVarNames at: index) with: objectsArray) ]
			ifFalse: [ 
				rowanInspectorService
					add:
						(Array
							with: (instVarNames at: index)
							with:
								(self prepareObjectForReplication: (serverInspectorService instVarAt: index))) ] ]
]

{ #category : 'client actions' }
SpkScaffoldingInspectorServiceServer >> prepareObjectForReplication: object [
	"RSR Doesn't support Associations"

	^ (object isKindOf: Association)
		ifTrue: [ Array with: object key with: object value ]
		ifFalse: [ object ]
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
