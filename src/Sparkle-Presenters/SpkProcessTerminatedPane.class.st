Class {
	#name : 'SpkProcessTerminatedPane',
	#superclass : 'SpkErrorPane',
	#category : 'Sparkle-Presenters-Presenters',
	#package : 'Sparkle-Presenters',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
SpkProcessTerminatedPane >> errorText [

	^ 'The process has terminated.'
]

{ #category : 'accessing' }
SpkProcessTerminatedPane >> labelString [

	^ 'Process ' , model oop hex
]
