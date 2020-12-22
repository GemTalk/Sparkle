Class {
	#name : 'SpkCompilationErrorTool',
	#superclass : 'SpkTool',
	#instVars : [
		'sourceCode',
		'errorMessage',
		'errorLocation'
	],
	#category : 'Sparkle-Tools-Pharo-Tools'
}

{ #category : 'as yet unclassified' }
SpkCompilationErrorTool class >> forException: aSyntaxErrorNotification [

	^ self new
		  initializeFrom: aSyntaxErrorNotification;
		  yourself
]

{ #category : 'accessing' }
SpkCompilationErrorTool >> errorLocation [

	^ errorLocation
]

{ #category : 'accessing' }
SpkCompilationErrorTool >> errorMessage [

	^ errorMessage
]

{ #category : 'initialization' }
SpkCompilationErrorTool >> initializeFrom: aSyntaxErrorNotification [

	sourceCode := aSyntaxErrorNotification errorCode.
	errorMessage := aSyntaxErrorNotification errorMessage.
	errorLocation := aSyntaxErrorNotification location
]

{ #category : 'accessing' }
SpkCompilationErrorTool >> sourceCode [

	^ sourceCode
]
