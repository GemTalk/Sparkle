Class {
	#name : 'SpkCompilationErrorTool',
	#superclass : 'SpkTool',
	#instVars : [
		'sourceCode',
		'errorMessage',
		'errorLocation'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
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

{ #category : 'accessing' }
SpkCompilationErrorTool >> sourceCode [

	^ sourceCode
]
