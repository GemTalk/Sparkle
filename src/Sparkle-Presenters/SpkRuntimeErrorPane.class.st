Class {
	#name : 'SpkRuntimeErrorPane',
	#superclass : 'SpkErrorPane',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkRuntimeErrorPane >> errorText [

	| ws |
	ws := WriteStream on: String new.
	ws
		<< model title;
		cr;
		<< '==============';
		cr;
		<< model stack.
	^ ws contents
]

{ #category : 'accessing' }
SpkRuntimeErrorPane >> labelString [

	^ 'Runtime Error'
]
