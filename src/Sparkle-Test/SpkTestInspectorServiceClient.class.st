Class {
	#name : 'SpkTestInspectorServiceClient',
	#superclass : 'SpkInspectorServiceClient',
	#category : 'Sparkle-Test-Test Services'
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
				 description: 'June 6, 776');
		add: (SpkTestInspectorFieldServiceClient
				 name: 'flameReserve'
				 description: '0.97');
		add: (SpkTestInspectorFieldServiceClient
				 name: 'pets'
				 description: '#(''St. George'')').
	^ cuddles
]

{ #category : 'test instances' }
SpkTestInspectorServiceClient class >> wingspan [

	| inspector |
	inspector := self new
		             oop: 16r1A2;
		             classMembershipDescription: 'a SmallInteger';
		             selfDescription: '52'.
	^ inspector
]
