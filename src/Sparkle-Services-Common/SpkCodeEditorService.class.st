Class {
	#name : 'SpkCodeEditorService',
	#superclass : 'RsrService',
	#instVars : [
		'savedSource',
		'unsavedSource'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'initialization' }
SpkCodeEditorService >> initialize [

	super initialize.
	savedSource := unsavedSource := ''
]

{ #category : 'accessing' }
SpkCodeEditorService >> savedSource [
	^ savedSource
]

{ #category : 'accessing' }
SpkCodeEditorService >> savedSource: anObject [
	savedSource := anObject
]

{ #category : 'accessing' }
SpkCodeEditorService >> unsavedSource [
	^ unsavedSource
]

{ #category : 'accessing' }
SpkCodeEditorService >> unsavedSource: anObject [
	unsavedSource := anObject
]
