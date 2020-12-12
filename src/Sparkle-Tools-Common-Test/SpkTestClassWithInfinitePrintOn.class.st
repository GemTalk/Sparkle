Class {
	#name : 'SpkTestClassWithInfinitePrintOn',
	#superclass : 'SpkObject',
	#category : 'Sparkle-Tools-Common-Test'
}

{ #category : 'printing' }
SpkTestClassWithInfinitePrintOn >> printOn: aStream [

	[ aStream << 'done yet? ' ] repeat
]
