Class {
	#name : 'SpkInspectorViewService',
	#superclass : 'RsrService',
	#instVars : [
		'name',
		'fields'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkInspectorViewService class >> templateClassName [

	^ #SpkInspectorViewService
]

{ #category : 'accessing' }
SpkInspectorViewService >> fields [

	^ fields
]

{ #category : 'accessing' }
SpkInspectorViewService >> fields: anObject [

	fields := anObject
]

{ #category : 'accessing' }
SpkInspectorViewService >> name [

	^ name
]

{ #category : 'accessing' }
SpkInspectorViewService >> name: anObject [

	name := anObject
]
