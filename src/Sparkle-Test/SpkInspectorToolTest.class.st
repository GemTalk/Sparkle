Class {
	#name : 'SpkInspectorToolTest',
	#superclass : 'TestCase',
	#instVars : [
		'tool'
	],
	#category : 'Sparkle-Test-Pharo Unit Tests'
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

	tool := SpkInspectorTool on: Object new.
	self assert: tool classMembershipDescription equals: 'an Object'.
	tool := SpkInspectorTool on: SpkTestSubclassOfNil basicNew.
	self
		assert: tool classMembershipDescription
		equals: 'a SpkTestSubclassOfNil'
]

{ #category : 'tests' }
SpkInspectorToolTest >> testInstVarsDo [
	self deny: true "Needs to be written"
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
