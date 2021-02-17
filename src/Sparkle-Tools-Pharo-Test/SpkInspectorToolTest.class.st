Class {
	#name : 'SpkInspectorToolTest',
	#superclass : 'SpkTestCase',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Tools-Pharo-Test'
}

{ #category : 'tests' }
SpkInspectorToolTest >> testClassMembershipDescription [

	tool := SpkInspectorTool on: nil.
	self
		assert: tool classMembershipDescription
		equals: 'an UndefinedObject'.

	tool := SpkInspectorTool on: nil class.
	self
		assert: tool classMembershipDescription
		equals: 'UndefinedObject'.

	tool := SpkInspectorTool on: 42.
	self assert: tool classMembershipDescription equals: 'a SmallInteger'.

	tool := SpkInspectorTool on: 'Hi!'.
	self assert: tool classMembershipDescription equals: 'a ' , '' class name asString.

	tool := SpkInspectorTool on: Object new.
	self assert: tool classMembershipDescription equals: 'an Object'.

	tool := SpkInspectorTool on: SpkTestSubclassOfNil basicNew.
	self
		assert: tool classMembershipDescription
		equals: 'a SpkTestSubclassOfNil'
]

{ #category : 'tests' }
SpkInspectorToolTest >> testFieldToolsSize [

	"Here, just testing that we get the right number of FieldTools back."

	tool := SpkInspectorTool on: nil.
	self assert: tool fieldTools size equals: 0.

	tool := SpkInspectorTool on: nil class.
	self assert: tool fieldTools size equals: 11.

	tool := SpkInspectorTool on: 42.
	self assert: tool fieldTools size equals: 0.

	tool := SpkInspectorTool on: 'Hi!'.
	self assert: tool fieldTools size equals: 3.

	tool := SpkInspectorTool on: Object new.
	self assert: tool fieldTools size equals: 0.

	tool := SpkInspectorTool on: SpkTestSubclassOfNil basicNew.
	self assert: tool fieldTools size equals: 2.

	tool := SpkInspectorTool on: SpkTestClassWithInfinitePrintOn new.
	self assert: tool fieldTools size equals: 0.

	"ZeroDivide has both inherited and declared named instvars"
	tool := SpkInspectorTool on: ZeroDivide new.
	self assert: tool fieldTools size equals: 7.

	"Class with both named and indexed instvars."
	tool := SpkInspectorTool on:
		        (SpkTestClassWithNamedAndIndexedInstvars new: 5).
	self assert: tool fieldTools size equals: 8
]

{ #category : 'tests' }
SpkInspectorToolTest >> testOop [

	| object |
	tool := SpkInspectorTool on: nil.
	self assert: tool oop equals: nil identityHash.
	tool := SpkInspectorTool on: 42.
	self assert: tool oop equals: 42 identityHash.
	object := Object new.
	tool := SpkInspectorTool on: object.
	self assert: tool oop equals: object identityHash.
	tool := SpkInspectorTool on: SpkTestSubclassOfNil basicNew.
	self assert: tool oop equals: 0
]

{ #category : 'tests' }
SpkInspectorToolTest >> testSelfDescription [

	| description |
	tool := SpkInspectorTool on: nil.
	self assert: tool selfDescription equals: 'nil'.

	tool := SpkInspectorTool on: nil class.
	self assert: tool selfDescription equals: 'UndefinedObject'.

	tool := SpkInspectorTool on: 42.
	self assert: tool selfDescription equals: '42'.

	tool := SpkInspectorTool on: 'Hi!'.
	self assert: tool selfDescription equals: '''Hi!'''.

	tool := SpkInspectorTool on: Object new.
	self assert: tool selfDescription equals: 'an Object'.

	tool := SpkInspectorTool on: SpkTestSubclassOfNil basicNew.
	self assert: tool selfDescription equals: ''.

	tool := SpkInspectorTool on: SpkTestClassWithInfinitePrintOn new.
	description := tool selfDescription.
	self
		assert: description size equals: 250000;
		assert: (description beginsWith: 'done yet? done yet? ');
		assert: (description endsWith: 'done yet? done yet? ')
]
