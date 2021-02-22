Class {
	#name : 'SpkSmallStackTest',
	#superclass : 'SpkTestCase',
	#instVars : [
		'stack'
	],
	#category : 'Sparkle-Tools-Common-Test'
}

{ #category : 'running' }
SpkSmallStackTest >> setUp [
	super setUp.
	stack := SpkSmallStack new
]

{ #category : 'tests' }
SpkSmallStackTest >> testCollect [
	self assert: stack isEmpty.
	stack push: 'first'.
	stack push: 'second'.
	stack push: 'third'.
	self
		assert: (stack collect: [ :each | each first ])
		equals: (OrderedCollection withAll: #($t $s $f))
]

{ #category : 'tests' }
SpkSmallStackTest >> testEmptyStack [
	self assert: stack isEmpty
]

{ #category : 'tests' }
SpkSmallStackTest >> testPopWhenEmpty [
	self should: [ stack pop ] raise: Error.
	stack push: 'aThing'.
	stack pop.
	self should: [ stack pop ] raise: Error
]

{ #category : 'tests' }
SpkSmallStackTest >> testPushPop [
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
SpkSmallStackTest >> testReducingLimit [
	self assert: stack limit equals: stack class defaultLimit.
	self assert: stack isEmpty.
	stack push: 'first'.
	stack push: 'second'.
	stack push: 'third'.
	stack limit: 2.
	self assert: stack pop equals: 'third'.
	self assert: stack pop equals: 'second'.
	self assert: stack isEmpty
]

{ #category : 'tests' }
SpkSmallStackTest >> testStackLimit [
	self assert: stack limit equals: stack class defaultLimit.
	stack limit: 2.
	self assert: stack isEmpty.
	stack push: 'first'.
	stack push: 'second'.
	stack push: 'third'.
	self assert: stack pop equals: 'third'.
	self assert: stack pop equals: 'second'.
	self assert: stack isEmpty
]
