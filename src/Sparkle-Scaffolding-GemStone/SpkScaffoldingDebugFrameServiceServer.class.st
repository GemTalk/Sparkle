Class {
	#name : 'SpkScaffoldingDebugFrameServiceServer',
	#superclass : 'SpkScaffoldingDebugFrameService',
	#instVars : [
		'rowanFrameService'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> label [
	^ label ifNil: [ label := self rowanFrameService _label ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> methodService [
	methodService
		ifNil: [ 
			methodService := SpkScaffoldingDebugMethodServiceServer new
				rowanMethodService: rowanFrameService _method;
				yourself ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> rowanFrameService [
	^rowanFrameService
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> rowanFrameService: object [
	rowanFrameService := object.
	self methodService.	"prime the pump"
	variableMap := Dictionary new.
	rowanFrameService _vars
		do: [ :rowanVariableService | variableMap at: rowanVariableService _key put: rowanVariableService _value ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> variableMap [
	^ variableMap
]
