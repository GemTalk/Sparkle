Class {
	#name : 'SpkTestClassWithInfinitePrintOn',
	#superclass : 'Object',
	#category : 'Sparkle-Test-Pharo Unit Tests'
}

{ #category : 'printing' }
SpkTestClassWithInfinitePrintOn >> printOn: aStream [

	[ aStream << 'done yet? ' ] repeat
]
