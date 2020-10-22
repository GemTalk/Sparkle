Class {
	#name : 'SpkTestInspectorServiceClient',
	#superclass : 'SpkInspectorServiceClient',
	#category : 'Sparkle-Test-Pharo'
}

{ #category : 'test instances' }
SpkTestInspectorServiceClient class >> cuddles [

	^ self new
		  oop: 16rd00f01;
		  classMembershipDescription: 'a Dragon';
		  selfDescription: 'Cuddles the Dragon';
		  fieldNames:
			  #( 'name' 'wingspan' 'birthday' 'flameReserve' 'pets' );
		  fieldDescriptions:
			  #( 'Cuddles' '52' 'June 6, 776' '0.97' '#(''St. George'')' );
		  yourself
]
