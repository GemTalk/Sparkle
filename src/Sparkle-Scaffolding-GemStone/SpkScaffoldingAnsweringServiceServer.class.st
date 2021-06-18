Class {
	#name : 'SpkScaffoldingAnsweringServiceServer',
	#superclass : 'SpkScaffoldingAnsweringService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingAnsweringServiceServer >> allClassNames [
	
	(self rowanService organizer: ClassOrganizer new) allClassNames.
	^self rowanService answer
]

{ #category : 'initialization' }
SpkScaffoldingAnsweringServiceServer >> initializeService [
	super initializeService.
	self rowanService organizer
		ifNil: [ self rowanService organizer: ClassOrganizer new ]
]

{ #category : 'accessing' }
SpkScaffoldingAnsweringServiceServer >> rowanServiceClass [

	^RowanAnsweringService
]
