Class {
	#name : 'SpkTestClassWithInfinitePrintOn',
	#superclass : 'Object',
	#category : 'Sparkle-Tools-Common-Test'
}

{ #category : 'printing' }
SpkTestClassWithInfinitePrintOn >> printOn: aStream [

	[ aStream << 'done yet? ' ] repeat
]
