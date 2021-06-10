Class {
	#name : 'SpkScaffoldingProjectServiceClient',
	#superclass : 'SpkScaffoldingProjectService',
	#category : 'Sparkle-Scaffolding-Pharo'
}

{ #category : 'updating' }
SpkScaffoldingProjectServiceClient >> initialize [

	| promise |
	promise := self update.
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

{ #category : 'updating' }
SpkScaffoldingProjectServiceClient >> update [

	^remoteSelf update
]
