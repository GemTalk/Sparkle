Class {
	#name : 'SpkScaffoldingAnsweringServiceServer',
	#superclass : 'SpkScaffoldingAnsweringService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'accessing' }
SpkScaffoldingAnsweringServiceServer >> allClassNames [

	^self rowanService allClassNames
]

{ #category : 'accessing' }
SpkScaffoldingAnsweringServiceServer >> rowanServiceClass [

	^RowanAnsweringService
]
