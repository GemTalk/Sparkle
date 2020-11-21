Class {
	#name : 'SpkPaneCoordinateTest',
	#superclass : 'TestCase',
	#instVars : [
		'inst1',
		'inst2'
	],
	#category : 'Sparkle-Test-Pharo Unit Tests'
}

{ #category : 'support' }
SpkPaneCoordinateTest >> newInstance [

	^ SpkPaneCoordinate new
]

{ #category : 'tests' }
SpkPaneCoordinateTest >> testEquality1 [

	inst1 := self newInstance , 1 , 2 , 3.
	self assert: inst1 = inst1.
	inst2 := self newInstance , 1 , 2 , 3.
	self assert: inst1 = inst2.
	self assert: inst2 = inst1.
	inst2 := inst1 copy.
	self deny: inst1 == inst2.
	self assert: inst1 = inst2.
	inst2 := inst1 , 0.
	self deny: inst1 = inst2.
	inst1 := inst1 , 0.
	self assert: inst1 = inst2
]

{ #category : 'tests' }
SpkPaneCoordinateTest >> testEquality2 [

	inst1 := self newInstance , (3 / 2) , 2 , 3.
	self assert: inst1 = inst1.
	inst2 := self newInstance , 1.5 , 2 , 3.
	self assert: inst1 = inst2.
	inst1 := self newInstance , (3 / 2) , 2 , 0.4.
	inst2 := self newInstance , 1.5 , 2 , (4 / 10).
	self deny: inst1 = inst2.
	self deny: inst2 = inst1
]

{ #category : 'tests' }
SpkPaneCoordinateTest >> testHash1 [

	inst1 := self newInstance , 1 , 2 , 3.
	self assert: inst1 hash = inst1 hash.
	inst2 := self newInstance , 1 , 2 , 3.
	self assert: inst1 hash = inst2 hash.
	inst2 := inst1 copy.
	self assert: inst1 hash = inst2 hash.
	inst2 := inst1 , 0.
	self deny: inst1 hash = inst2 hash. "Could actually be equal, but better if it's not"
	inst1 := inst1 , 0.
	self assert: inst1 hash = inst2 hash
]

{ #category : 'tests' }
SpkPaneCoordinateTest >> testHash2 [

	inst1 := self newInstance , (3 / 2) , 2 , 3.
	self assert: inst1 hash = inst1 hash.
	inst2 := self newInstance , 1.5 , 2 , 3.
	self assert: inst1 hash = inst2 hash.
	inst1 := self newInstance , (3 / 2) , 2 , 0.4.
	inst2 := self newInstance , 1.5 , 2 , (4 / 10).
	self deny: inst1 hash = inst2 hash
]

{ #category : 'tests' }
SpkPaneCoordinateTest >> testInequality1 [

	inst1 := self newInstance , 1 , 2 , 3.
	inst2 := self newInstance , 1 , 2 , 3.
	self deny: inst1 < inst2.
	self assert: inst2 <= inst1.
	self deny: inst1 > inst2.
	self assert: inst2 >= inst1.
	inst2 := inst1 , 0.
	self deny: inst1 > inst2.
	self deny: inst1 >= inst2.
	self assert: inst1 < inst2
]

{ #category : 'tests' }
SpkPaneCoordinateTest >> testInequality2 [

	inst1 := self newInstance , 1 , 2 , 3.
	inst2 := self newInstance , 2 , 2 , 3.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.
	
	inst1 := self newInstance , 1 , 2 , 3.
	inst2 := self newInstance , 1 , 3 , 3.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.

	inst1 := self newInstance , 1 , 2 , 3.
	inst2 := self newInstance , 1 , 2 , 4.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.

	inst1 := self newInstance , 1 , 2 , 3.
	inst2 := self newInstance , 1 , 2 , 3 , 0.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.

	inst1 := self newInstance , 1 , 2 , 3.
	inst2 := self newInstance , 1 , 2 , 4 , 0.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.

	inst1 := self newInstance , 1 , 2 , 3.
	inst2 := self newInstance , 1 , 3 , 3 , 0.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.

	inst1 := self newInstance , 1 , 2 , 3.
	inst2 := self newInstance , 2 , 2 , 3 , 0.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.
	
	inst1 := self newInstance , 1 , 2 , 3 , 1000.
	inst2 := self newInstance , 1 , 2 , 4.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.

	inst1 := self newInstance , 1 , 2 , 3 , 1000.
	inst2 := self newInstance , 1 , 3 , 3.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.

	inst1 := self newInstance , 1 , 2 , 3 , 1000.
	inst2 := self newInstance , 2 , 2 , 3.
	self assert: inst1 < inst2.
	self assert: inst1 <= inst2.
	self deny: inst1 > inst2.


]
