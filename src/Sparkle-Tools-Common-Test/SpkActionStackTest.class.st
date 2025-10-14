Class {
	#name : 'SpkActionStackTest',
	#superclass : 'SpkTestCase',
	#instVars : [
		'stack'
	],
	#category : 'Sparkle-Tools-Common-Test',
	#package : 'Sparkle-Tools-Common-Test'
}

{ #category : 'running' }
SpkActionStackTest >> setUp [
	super setUp.
	stack := SpkActionStack new
]

{ #category : 'tests' }
SpkActionStackTest >> testCollect [
	self assert: stack isEmpty.
	stack push: 'first'.
	stack push: 'second'.
	stack push: 'third'.
	self
		assert: (stack collect: [ :each | each first ])
		equals: (OrderedCollection withAll: #($t $s $f))
]

{ #category : 'tests' }
SpkActionStackTest >> testEmptyStack [
	self assert: stack isEmpty
]

{ #category : 'tests' }
SpkActionStackTest >> testPopWhenEmpty [
	self should: [ stack pop ] raise: Error.
	stack push: 'aThing'.
	stack pop.
	self should: [ stack pop ] raise: Error
]

{ #category : 'tests' }
SpkActionStackTest >> testPushPop [
	self assert: stack isEmpty.
	stack push: 'one'.
	self deny: stack isEmpty.
	stack push: 'two'.
	self deny: stack isEmpty.
	stack push: 'three'.
	self deny: stack isEmpty.
	self assert: stack pop equals: 'three'.
	self deny: stack isEmpty.
	self assert: stack pop equals: 'two'.
	self deny: stack isEmpty.
	self assert: stack pop equals: 'one'.
	self assert: stack isEmpty
]

{ #category : 'tests' }
SpkActionStackTest >> testReducingLimit [

	self assert: stack limit >= 3.
	self assert: stack isEmpty.
	stack push: (SpkTestUndoableAction withValue: 'first').
	stack push: (SpkTestUndoableAction withValue: 'second').
	stack push: (SpkTestUndoableAction withValue: 'third').
	stack limit: 2.
	self assert: stack pop value equals: 'third'.
	self assert: stack pop value equals: 'second'.
	self assert: stack isEmpty
]

{ #category : 'tests' }
SpkActionStackTest >> testStackLimit [

	self assert: stack limit >= 3.
	stack limit: 2.
	self assert: stack isEmpty.
	stack push: (SpkTestUndoableAction withValue: 'first').
	stack push: (SpkTestUndoableAction withValue: 'second').
	stack push: (SpkTestUndoableAction withValue: 'third').
	self assert: stack pop value equals: 'third'.
	self assert: stack pop value equals: 'second'.
	self assert: stack isEmpty
]
