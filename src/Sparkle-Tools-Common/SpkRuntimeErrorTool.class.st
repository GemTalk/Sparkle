Class {
	#name : 'SpkRuntimeErrorTool',
	#superclass : 'SpkTool',
	#instVars : [
		'stack',
		'title'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'instance creation' }
SpkRuntimeErrorTool class >> forException: anError [

	^ self new
		  initializeFromException: anError;
		  yourself
]

{ #category : 'initialization' }
SpkRuntimeErrorTool >> initializeFromException: anError [

	title := SpkReflection
		         carefullySend: #description
		         withArguments: #(  )
		         to: anError
		         ifNotUnderstood: [ 'Indescribable exception' ].
	stack := RsrProcessModel currentStackDump
]

{ #category : 'accessing' }
SpkRuntimeErrorTool >> stack [

	^ stack
]

{ #category : 'accessing' }
SpkRuntimeErrorTool >> title [

	^ title
]
