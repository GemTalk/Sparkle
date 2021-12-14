Class {
	#name : 'SpkTestClassWithDynamicPrintOn',
	#superclass : 'SpkObject',
	#instVars : [
		'printOnAction'
	],
	#category : 'Sparkle-Tools-Common-Test'
}

{ #category : 'instance creation' }
SpkTestClassWithDynamicPrintOn class >> printOnAction: aBlock [

	^super new
		printOnAction: aBlock;
		yourself
]

{ #category : 'printing' }
SpkTestClassWithDynamicPrintOn >> printOn: aStream [

	printOnAction cull: aStream
]

{ #category : 'accessing' }
SpkTestClassWithDynamicPrintOn >> printOnAction: aBlock [

	printOnAction := aBlock
]
