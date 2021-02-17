"
A common abstract superclass for all Sparkle tests, which makes it easier to build a suite in GemStone.
"
Class {
	#name : 'SpkTestCase',
	#superclass : 'TestCase',
	#category : 'Sparkle-Tools-Common-Test'
}

{ #category : 'testing' }
SpkTestCase class >> isAbstract [

	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self == SpkTestCase
]

{ #category : 'asserting' }
SpkTestCase >> assert: anObject
identicalTo: bObject [

	self assert: anObject == bObject
]
