Class {
	#name : 'SpkProcessTool',
	#superclass : 'SpkTool',
	#instVars : [
		'process'
	],
	#category : 'Sparkle-Tools-GemStone'
}

{ #category : 'accessing' }
SpkProcessTool >> name [

	^process name
]

{ #category : 'accessing' }
SpkProcessTool >> oop [

	^process asOop
]

{ #category : 'accessing' }
SpkProcessTool >> priority [

	^process priority
]

{ #category : 'accessing' }
SpkProcessTool >> process [

	^process
]

{ #category : 'accessing' }
SpkProcessTool >> process: aProcess [

	process := aProcess
]

{ #category : 'accessing' }
SpkProcessTool >> stack [

	| report |
	report := process _reportOfSize: 3000.
	^String
		new: 16 * report size
		streamContents: [ :stream | report do: [ :each | stream nextPutAll: each ] separatedBy: [ stream lf ] ]
]

{ #category : 'accessing' }
SpkProcessTool >> status [

	^process _statusString
]
