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

{ #category : 'actions' }
SpkWorkspaceServiceClient >> accept [

	"Send my text to the server to be evaluated, inspect the returned object or error that results."
	self flag: #TODO.
	"Accept operates at the level of an individual evaluator, so should be part of an evaluator service,
	not the workspace service, which can have many evaluators."

	self notYetImplemented: 'Accept'
]

{ #category : 'actions' }
SpkWorkspaceServiceClient >> cancel [

	"Send a cancel to the server, with the text being canceled, to be recorded so the cancel
	can be undone."

	self flag: #TODO.
	"Cancel operates at the level of an individual evaluator, so should be part of an evaluator service,
	not the workspace service, which can have many evaluators."
	self notYetImplemented: 'Cancel'
]

{ #category : 'actions' }
SpkWorkspaceServiceClient >> debugIt [

	self flag: #TODO.
	"Debug it operates at the level of an individual evaluator, so should be part of an evaluator service,
	not the workspace service, which can have many evaluators."
	self notYetImplemented: 'Debug it'
]

{ #category : 'actions' }
SpkWorkspaceServiceClient >> doIt [

	self flag: #TODO.
	"Do it operates at the level of an individual evaluator, so should be part of an evaluator service,
	not the workspace service, which can have many evaluators."
	self notYetImplemented: 'Do it'
]

{ #category : 'actions' }
SpkWorkspaceServiceClient >> formatCode [

	self flag: #TODO.
	"formatCode operates at the level of an individual evaluator, so should be part of an evaluator service,
	not the workspace service, which can have many evaluators."
	self notYetImplemented: 'Format Code'
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

{ #category : 'actions' }
SpkWorkspaceServiceClient >> redo [

	"Need to coordinate local redo operations (simple typing and the like) with operations that require
	the server, such as redoing an accept or cancel. It's not yet clear exactly how to hook that together."

	self notYetImplemented: 'Redo'
]

{ #category : 'actions' }
SpkWorkspaceServiceClient >> undo [

	"Need to coordinate local undo operations (simple typing and the like) with operations that require
	the server, such as undoing an accept or cancel. It's not yet clear exactly how to hook that together.
	It seems like undo/redo should operate on the scope of the entire workspace window, not on the level
	of an individual pane."

	self notYetImplemented: 'Undo'
]

{ #category : 'accessing' }
SpkWorkspaceServiceClient >> unsavedSource: aString [

	unsavedSource ~= aString ifTrue: [ 
		unsavedSource := aString.
		self
			updateHasUnsavedChanges;
			announce: (SpkContentsChangedAnnouncement new
					 newContents: unsavedSource;
					 yourself) ]
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
