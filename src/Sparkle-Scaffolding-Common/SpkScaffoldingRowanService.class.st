Class {
	#name : 'SpkScaffoldingRowanService',
	#superclass : 'SpkScaffoldingAbstractService',
	#instVars : [
		'rsrRowanService'
	],
	#category : 'Sparkle-Scaffolding-Common'
}

{ #category : 'initialization' }
SpkScaffoldingRowanService >> initializeService [

	| promise |
	promise := remoteSelf initializeService.
	promise when: [ :result | "no action needed" ] catch: [ :reason | 
		Transcript
			cr;
			show: '=========';
			cr;
			show: 'UNEXPECTED CATCH: ' , reason printString;
			cr;
			show: DateAndTime now printString;
			cr;
			show: '=========';
			yourself ]
]
