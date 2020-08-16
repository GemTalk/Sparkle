Class {
	#name : 'SpkWorkspaceServiceClient',
	#superclass : 'SpkWorkspaceService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#instVars : [
		'hasUnsavedChanges'
	],
	#category : 'Sparkle-Services-PharoClient'
}

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
