Class {
	#name : 'SpkInspectorToolTest',
	#superclass : 'SpkToolTest',
	#category : 'Sparkle-Tools-Pharo-Test'
}

{ #category : 'accessing' }
SpkInspectorToolTest >> objectWithErroneousPrintOn [

	^SpkTestClassWithDynamicPrintOn printOnAction: [:stream | Error signal]
]

{ #category : 'accessing' }
SpkInspectorToolTest >> objectWithInfinitePrintOn [

	^SpkTestClassWithDynamicPrintOn printOnAction: [:stream | [ stream << 'done yet? ' ] repeat]
]

{ #category : 'tests' }
SpkInspectorToolTest >> testClassMembershipDescription [

	self newInspectorToolOn: nil.
	self
		assert: tool classMembershipDescription
		equals: 'an UndefinedObject'.

	self newInspectorToolOn: nil class.
	self
		assert: tool classMembershipDescription
		equals: 'UndefinedObject'.

	self newInspectorToolOn: 42.
	self assert: tool classMembershipDescription equals: 'a SmallInteger'.

	self newInspectorToolOn: 'Hi!'.
	self
		assert: tool classMembershipDescription
		equals: 'a ' , '' class name asString.

	self newInspectorToolOn: Object new.
	self assert: tool classMembershipDescription equals: 'an Object'.

	self newInspectorToolOn: SpkTestSubclassOfNil basicNew.
	self
		assert: tool classMembershipDescription
		equals: 'a SpkTestSubclassOfNil'
]

{ #category : 'tests' }
SpkInspectorToolTest >> testFieldToolsSize [

	"Here, just testing that we get the right number of FieldTools back."

	self newInspectorToolOn: nil.
	self assert: tool fieldTools size equals: 0.

	self newInspectorToolOn: nil class.
	self assert: tool fieldTools size equals: 11.

	self newInspectorToolOn: 42.
	self assert: tool fieldTools size equals: 0.

	self newInspectorToolOn: 'Hi!'.
	self assert: tool fieldTools size equals: 3.

	self newInspectorToolOn: Object new.
	self assert: tool fieldTools size equals: 0.

	self newInspectorToolOn: SpkTestSubclassOfNil basicNew.
	self assert: tool fieldTools size equals: 2.

	"ZeroDivide has both inherited and declared named instvars"
	self newInspectorToolOn: ZeroDivide new.
	self assert: tool fieldTools size equals: 7.

	"Class with both named and indexed instvars."
	self newInspectorToolOn: (SpkTestClassWithNamedAndIndexedInstvars new: 5).
	self assert: tool fieldTools size equals: 8
]

{ #category : 'tests' }
SpkInspectorToolTest >> testOop [

	| object |
	self newInspectorToolOn: nil.
	self assert: tool oop equals: nil identityHash.
	self newInspectorToolOn: 42.
	self assert: tool oop equals: 42 identityHash.
	object := Object new.
	self newInspectorToolOn: object.
	self assert: tool oop equals: object identityHash.
	self newInspectorToolOn: SpkTestSubclassOfNil basicNew.
	self assert: tool oop equals: 0
]

{ #category : 'tests' }
SpkInspectorToolTest >> testSelfDescription [

	| description |
	self newInspectorToolOn: nil.
	self assert: tool selfDescription equals: 'nil'.

	self newInspectorToolOn: nil class.
	self assert: tool selfDescription equals: 'UndefinedObject'.

	self newInspectorToolOn: 42.
	self assert: tool selfDescription equals: '42'.

	self newInspectorToolOn: 'Hi!'.
	self assert: tool selfDescription equals: '''Hi!'''.

	self newInspectorToolOn: Object new.
	self assert: tool selfDescription equals: 'an Object'.

	self newInspectorToolOn: SpkTestSubclassOfNil basicNew.
	self assert: tool selfDescription equals: ''.

	self newInspectorToolOn: self objectWithInfinitePrintOn.
	description := tool selfDescription.
	self
		assert: description size equals: 250000;
		assert: (description beginsWith: 'done yet? done yet? ');
		assert: (description endsWith: 'done yet? done yet? ').

	self newInspectorToolOn: self objectWithErroneousPrintOn.
	self assert: tool selfDescription equals: ''
]
