Class {
	#name : 'SpkProcessTerminatedPane',
	#superclass : 'SpkErrorPane',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkProcessTerminatedPane >> errorText [

	^ 'The process has terminated.'
]

{ #category : 'accessing' }
SpkProcessTerminatedPane >> labelString [

	^ 'Process 16r' , model oop hex
]
