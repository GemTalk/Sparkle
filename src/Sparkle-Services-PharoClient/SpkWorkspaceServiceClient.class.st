Class {
	#name : 'SpkWorkspaceServiceClient',
	#superclass : 'SpkWorkspaceService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#instVars : [
		'_announcer',
		'hasUnsavedChanges'
	],
	#category : 'Sparkle-Services-PharoClient'
}

{ #category : 'accessing' }
SpkWorkspaceServiceClient >> _announcer [
	^ _announcer
]

{ #category : 'accessing' }
SpkWorkspaceServiceClient >> _announcer: anObject [
	_announcer := anObject
]

{ #category : 'accessing' }
SpkWorkspaceServiceClient >> hasUnsavedChanges [
	^ hasUnsavedChanges
]

{ #category : 'accessing' }
SpkWorkspaceServiceClient >> hasUnsavedChanges: anObject [
	hasUnsavedChanges := anObject
]

{ #category : 'initialization' }
SpkWorkspaceServiceClient >> initialize [
	super initialize.
	hasUnsavedChanges := false
]
