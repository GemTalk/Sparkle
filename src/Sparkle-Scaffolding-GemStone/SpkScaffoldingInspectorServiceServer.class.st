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
		rowanInspectorService
			add:
				(Array
					with: (instVarNames at: index)
					with:
						(self prepareObjectForReplication: (serverInspectorService instVarAt: index))) ]
]

{ #category : 'client actions' }
SpkScaffoldingInspectorServiceServer >> prepareObjectForReplication: object [
	"RSR Doesn't support Associations"

	^ (object isKindOf: Association)
		ifTrue: [ Array with: object key with: object value ]
		ifFalse: [ object ]
]
