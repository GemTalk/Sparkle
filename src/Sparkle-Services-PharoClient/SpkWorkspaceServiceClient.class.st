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

{ #category : 'accessing' }
SpkWorkspaceServiceClient >> unsavedSource: aString [

	unsavedSource ~= aString ifTrue: [ 
		unsavedSource := aString.
		self
			updateHasUnsavedChanges;
			announce: SpkContentsChangedAnnouncement new ]
]

{ #category : 'as yet unclassified' }
SpkWorkspaceServiceClient >> updateHasUnsavedChanges [

	| nowHaveUnsavedChanges |
	nowHaveUnsavedChanges := savedSource ~= unsavedSource.
	nowHaveUnsavedChanges ~= hasUnsavedChanges ifTrue: [ 
		hasUnsavedChanges := nowHaveUnsavedChanges.
		self announce:
			(SpkUnsavedChangesAnnouncement hasUnsavedChanges: hasUnsavedChanges) ]
]
