Class {
	#name : 'SpkCompilationErrorPane',
	#superclass : 'SpkErrorPane',
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkCompilationErrorPane >> errorText [

	| ws rs |
	ws := WriteStream on: String new.
	rs := ReadStream on: model sourceCode.
	ws
		<< (rs next: model errorLocation - 1);
		cr;
		<< model errorMessage;
		<< '--> ';
		<< rs upToEnd.
	^ ws contents
]

{ #category : 'accessing' }
SpkCompilationErrorPane >> labelString [

	^ 'Compilation Error'
]
