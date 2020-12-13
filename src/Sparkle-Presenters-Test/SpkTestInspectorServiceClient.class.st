Class {
	#name : 'SpkTestInspectorServiceClient',
	#superclass : 'SpkInspectorServiceClient',
	#category : 'Sparkle-Presenters-Test-Support'
}

{ #category : 'test instances' }
SpkTestInspectorServiceClient class >> cuddles [

	| cuddles |
	cuddles := self new
		           oop: 16rd00f01;
		           classMembershipDescription: 'a Dragon';
		           selfDescription: 'Cuddles the Dragon'.
	cuddles fields
		add: (SpkTestInspectorFieldServiceClient
				 name: 'name'
				 description: '''Cuddles''');
		add: (SpkTestInspectorFieldServiceClient
				 name: 'description'
				 description:
					 '''Very large. Scaly. Slightly radioactive. Tends to erupt in flame unpredictably, and possibly unintentionally.''');
		add:
			(SpkTestInspectorFieldServiceClient
				 name: 'wingspan'
				 description: '52');
		add: (SpkTestInspectorFieldServiceClient
				 name: 'birthdate'
				 description: '06/06/776');
		add: (SpkTestInspectorFieldServiceClient
				 name: 'flameReserve'
				 description: '0.97');
		add: (SpkTestInspectorFieldServiceClient
				 name: 'pets'
				 description: 'anArray( ''St. George'')').
	^ cuddles
]

{ #category : 'test instances' }
SpkTestInspectorServiceClient class >> spkbirthdate [

	| inspector |
	inspector := self new
		             oop: 16r6109E4C;
		             classMembershipDescription: 'a SmallDate';
		             selfDescription: '06/06/776'.
	^ inspector
]

{ #category : 'test instances' }
SpkTestInspectorServiceClient class >> spkdescription [

	| inspector |
	inspector := self new
		             oop: 16r349ae0401;
		             classMembershipDescription: 'a String';
		             selfDescription: '''Very large. Scaly. Slightly radioactive. Tends to erupt in flame unpredictably, and possibly unintentionally.'''.
	inspector fields
		add:
			(SpkTestInspectorFieldServiceClient name: '1' description: 'Bogus');
		add:
			(SpkTestInspectorFieldServiceClient name: '2' description: 'hand-built');
		add:
			(SpkTestInspectorFieldServiceClient name: '3' description: 'inspector');
		add:
			(SpkTestInspectorFieldServiceClient name: '4' description: 'and this');
		add:
			(SpkTestInspectorFieldServiceClient name: '5' description: 'string is');
		add:
			(SpkTestInspectorFieldServiceClient name: '6' description: 'too');
		add:
			(SpkTestInspectorFieldServiceClient name: '7' description: 'long').
	^ inspector
]

{ #category : 'test instances' }
SpkTestInspectorServiceClient class >> spkflameReserve [

	| inspector |
	inspector := self new
		             oop: 16r7EF0A3D70A3D70A6;
		             classMembershipDescription: 'a SmallDouble';
		             selfDescription: '0.97'.
	^ inspector
]

{ #category : 'test instances' }
SpkTestInspectorServiceClient class >> spkname [

	| inspector |
	inspector := self new
		             oop: 16r1234fe01;
		             classMembershipDescription: 'a String';
		             selfDescription: '''Cuddles'''.
	inspector fields
		add:
			(SpkTestInspectorFieldServiceClient name: '1' description: '$C');
		add:
			(SpkTestInspectorFieldServiceClient name: '2' description: '$u');
		add:
			(SpkTestInspectorFieldServiceClient name: '3' description: '$d');
		add:
			(SpkTestInspectorFieldServiceClient name: '4' description: '$d');
		add:
			(SpkTestInspectorFieldServiceClient name: '5' description: '$l');
		add:
			(SpkTestInspectorFieldServiceClient name: '6' description: '$e');
		add:
			(SpkTestInspectorFieldServiceClient name: '7' description: '$s').
	^ inspector
]

{ #category : 'test instances' }
SpkTestInspectorServiceClient class >> spkpets [

	| inspector |
	inspector := self new
		             oop: 16r1BCB801;
		             classMembershipDescription: 'an Array';
		             selfDescription: 'anArray( ''St. George'')'.
	inspector fields add: (SpkTestInspectorFieldServiceClient
			 name: '1'
			 description: '''St. George''').
	^ inspector
]

{ #category : 'test instances' }
SpkTestInspectorServiceClient class >> spkwingspan [

	| inspector |
	inspector := self new
		             oop: 16r1A2;
		             classMembershipDescription: 'a SmallInteger';
		             selfDescription: '52'.
	^ inspector
]
