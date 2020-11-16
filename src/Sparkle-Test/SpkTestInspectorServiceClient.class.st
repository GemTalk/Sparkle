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
		add: (SpkInspectorFieldServiceClient
				 name: 'name'
				 description: '''Cuddles''');
		add: (SpkInspectorFieldServiceClient
				 name: 'description'
				 description:
					 '''Very large. Scaly. Slightly radioactive. Tends to erupt in flame unpredictably, and possibly unintentionally.''');
		add:
			(SpkInspectorFieldServiceClient name: 'wingspan' description: '52');
		add: (SpkInspectorFieldServiceClient
				 name: 'birthdate'
				 description: 'June 6, 776');
		add: (SpkInspectorFieldServiceClient
				 name: 'flameReserve'
				 description: '0.97');
		add: (SpkInspectorFieldServiceClient
				 name: 'pets'
				 description: '#(''St. George'')').
	^ cuddles
]
