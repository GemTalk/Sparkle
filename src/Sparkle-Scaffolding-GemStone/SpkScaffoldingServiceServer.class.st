Class {
	#name : 'SpkScaffoldingServiceServer',
	#superclass : 'SpkScaffoldingService',
	#category : 'Sparkle-Scaffolding-GemStone'
}

{ #category : 'acccessing' }
SpkScaffoldingServiceServer >> doit_01: aString [
	^ aString evaluate
]

{ #category : 'acccessing' }
SpkScaffoldingServiceServer >> doit_02: aString [
	doitResult := aString evaluate
]

{ #category : 'acccessing' }
SpkScaffoldingServiceServer >> doitResult [
	^ doitResult
]
