Class {
	#name : 'SpkScaffoldingDebugFrameServiceServer',
	#superclass : 'SpkScaffoldingDebugFrameService',
	#instVars : [
		'frameIndex',
		'rowanFrameService'
	],
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> frameIndex [
	^frameIndex
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> frameIndex: object [
	frameIndex := object
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> homeMethod [
	^ self method _homeMethod
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> label [
	^ label ifNil: [ label := self rowanFrameService _label ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> method [
	^ self rowanFrameService _method
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> methodService [
	^ methodService
		ifNil: [ 
			methodService := SpkScaffoldingDebugMethodServiceServer new
				rowanMethodService: rowanFrameService _method;
				yourself ]
]

{ #category : 'accessing' }
SpkScaffoldingDebugFrameServiceServer >> methodSource [
	^ methodSource ifNil: [ methodSource := self rowanFrameService _method source ]
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
