Extension { #name : 'SpkScaffoldingRowanService' }

{ #category : '*Sparkle-Scaffolding-Pharo' }
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

{ #category : '*Sparkle-Scaffolding-Pharo' }
SpkScaffoldingRowanService >> rowanService [

	^ rsrRowanService
]
