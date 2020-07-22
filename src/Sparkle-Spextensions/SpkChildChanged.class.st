Class {
	#name : 'SpkChildChanged',
	#superclass : 'Announcement',
	#instVars : [
		'child',
		'index'
	],
	#category : 'Sparkle-Spextensions-Spec2'
}

{ #category : 'accessing' }
SpkChildChanged >> child [
	^ child
]

{ #category : 'accessing' }
SpkChildChanged >> child: anObject [
	child := anObject
]

{ #category : 'accessing' }
SpkChildChanged >> index [
	^ index
]

{ #category : 'accessing' }
SpkChildChanged >> index: anObject [
	index := anObject
]
