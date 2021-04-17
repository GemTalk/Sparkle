"
I tell a pane where it should be in a column.

 
Internal Representation and Key Implementation Points.

    Instance Variables
	vector:		<OrderedCollection of number>


    Implementation Points

I'm a vector of one or more numbers. The first number is usually a Float between 0 and 1, and indicates the relative position of an independent pane in its column. Dependent panes have the vector of their parent, appended by a number (usually but not necessarily an integer) determined by their parent to indicate their position within the parent.

The first number in the vector is most-significant.
If two vectors are of different length, and all the numbers in the shorter vector are equal to the first ones in the longer vector, the shorter vector will compare as less than the longer one. (1,2) < (1,2,0) --> true.
Lesser coordinates go toward the top of a column, greater coordinates towards the bottom.

"
Class {
	#name : 'SpkPaneCoordinate',
	#superclass : 'Magnitude',
	#instVars : [
		'vector'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'instance creation' }
SpkPaneCoordinate class >> forVector: aSequenceableCollection [

	| newInstance |
	newInstance := self new.
	aSequenceableCollection do: [ :each | newInstance ,= each ].
	^ newInstance
]

{ #category : 'accumulator ops' }
SpkPaneCoordinate >> , aNumber [

	"Answer a copy of the receiver that has an additional number in its vector"

	^ self copy ,= aNumber
]

{ #category : 'private' }
SpkPaneCoordinate >> ,= aNumber [

	"Changes the value of the receiver to have an additional number in its vector"

	vector addLast: aNumber
]

{ #category : 'comparing' }
SpkPaneCoordinate >> < aMagnitude [

	"Answer whether the receiver is less than the argument."

	^ self species = aMagnitude species and: [ 
		  aMagnitude hasVectorGreaterThan: vector ]
]

{ #category : 'comparing' }
SpkPaneCoordinate >> = aMagnitude [

	^ self species = aMagnitude species and: [ 
		  aMagnitude hasVectorEqualTo: vector ]
]

{ #category : 'private' }
SpkPaneCoordinate >> hasVectorEqualTo: aVector [

	^ vector = aVector
]

{ #category : 'private' }
SpkPaneCoordinate >> hasVectorGreaterThan: otherVector [

	| commonSize |
	commonSize := vector size min: otherVector size.
	1 to: commonSize do: [ :i | 
		| other mine |
		mine := vector at: i.
		other := otherVector at: i.
		mine > other ifTrue: [ ^ true ].
		mine < other ifTrue: [ ^ false ] ].
	"If we get this far, the vectors are equal up to the length of the shorter vector, 
	longer vector is greater. If truly equal, false is the correct answer."
	^ vector size > otherVector size
]

{ #category : 'comparing' }
SpkPaneCoordinate >> hash [

	^ vector hash
]

{ #category : 'initialization' }
SpkPaneCoordinate >> initialize [

	super initialize.
	vector := OrderedCollection new
]

{ #category : 'private' }
SpkPaneCoordinate >> postCopy [

	vector := vector copy
]

{ #category : 'printing' }
SpkPaneCoordinate >> printOn: aStream [

	aStream
		<< self class name;
		<< '('.
	vector do: [ :each | each printOn: aStream ].
	aStream << ')'
]
