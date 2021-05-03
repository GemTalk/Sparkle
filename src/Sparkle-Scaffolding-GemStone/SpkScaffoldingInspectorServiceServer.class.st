Class {
	#name : 'SpkScaffoldingInspectorServiceServer',
	#superclass : 'SpkScaffoldingInspectorService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'client actions' }
SpkScaffoldingInspectorServiceServer >> inspect: anOop [
	| serverInspectorService instVarNames |
	serverInspectorService := RowanInspectorService new inspect: anOop.
	rowanInspectorService := Array new.
	instVarNames := serverInspectorService class allInstVarNames.
	1 to: instVarNames size do: [ :index | 
		rowanInspectorService
			add:
				(Array
					with: (instVarNames at: index)
					with: (serverInspectorService instVarAt: index)) ]
]
