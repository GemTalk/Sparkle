Class {
	#name : 'SpkInspectorToolTest',
	#superclass : 'SpkToolTest',
	#category : 'Sparkle-Tools-Pharo-Test'
}

{ #category : 'tests' }
SpkInspectorToolTest >> testClassMembershipDescription [

	self newToolOn: nil.
	self
		assert: tool classMembershipDescription
		equals: 'an UndefinedObject'.

	self newToolOn: nil class.
	self
		assert: tool classMembershipDescription
		equals: 'UndefinedObject'.

	self newToolOn: 42.
	self assert: tool classMembershipDescription equals: 'a SmallInteger'.

	self newToolOn: 'Hi!'.
	self
		assert: tool classMembershipDescription
		equals: 'a ' , '' class name asString.

	self newToolOn: Object new.
	self assert: tool classMembershipDescription equals: 'an Object'.

	self newToolOn: SpkTestSubclassOfNil basicNew.
	self
		assert: tool classMembershipDescription
		equals: 'a SpkTestSubclassOfNil'
]

{ #category : 'tests' }
SpkInspectorToolTest >> testFieldToolsSize [

	"Here, just testing that we get the right number of FieldTools back."

	self newToolOn: nil.
	self assert: tool fieldTools size equals: 0.

	self newToolOn: nil class.
	self assert: tool fieldTools size equals: 11.

	self newToolOn: 42.
	self assert: tool fieldTools size equals: 0.

	self newToolOn: 'Hi!'.
	self assert: tool fieldTools size equals: 3.

	self newToolOn: Object new.
	self assert: tool fieldTools size equals: 0.

	self newToolOn: SpkTestSubclassOfNil basicNew.
	self assert: tool fieldTools size equals: 2.

	self newToolOn: SpkTestClassWithInfinitePrintOn new.
	self assert: tool fieldTools size equals: 0.

	"ZeroDivide has both inherited and declared named instvars"
	self newToolOn: ZeroDivide new.
	self assert: tool fieldTools size equals: 7.

	"Class with both named and indexed instvars."
	self newToolOn: (SpkTestClassWithNamedAndIndexedInstvars new: 5).
	self assert: tool fieldTools size equals: 8
]

{ #category : 'tests' }
SpkInspectorToolTest >> testOop [

	| object |
	self newToolOn: nil.
	self assert: tool oop equals: nil identityHash.
	self newToolOn: 42.
	self assert: tool oop equals: 42 identityHash.
	object := Object new.
	self newToolOn: object.
	self assert: tool oop equals: object identityHash.
	self newToolOn: SpkTestSubclassOfNil basicNew.
	self assert: tool oop equals: 0
]

{ #category : 'tests' }
SpkInspectorToolTest >> testSelfDescription [

	| description |
	self newToolOn: nil.
	self assert: tool selfDescription equals: 'nil'.

	self newToolOn: nil class.
	self assert: tool selfDescription equals: 'UndefinedObject'.

	self newToolOn: 42.
	self assert: tool selfDescription equals: '42'.

	self newToolOn: 'Hi!'.
	self assert: tool selfDescription equals: '''Hi!'''.

	self newToolOn: Object new.
	self assert: tool selfDescription equals: 'an Object'.

	self newToolOn: SpkTestSubclassOfNil basicNew.
	self assert: tool selfDescription equals: ''.

	self newToolOn: SpkTestClassWithInfinitePrintOn new.
	description := tool selfDescription.
	self
		assert: description size equals: 250000;
		assert: (description beginsWith: 'done yet? done yet? ');
		assert: (description endsWith: 'done yet? done yet? ')
]
