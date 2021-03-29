Class {
	#name : 'SpkEvaluatorServiceClient',
	#superclass : 'SpkEvaluatorService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#instVars : [
		'hasUnsavedChanges',
		'inspectorService'
	],
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'actions' }
SpkEvaluatorServiceClient >> acceptFor: requestId [

	"Send my text to the server to be evaluated, announce the returned object or error that results."

	| promise |
	promise := remoteSelf accept.
	promise
		when: [ :newService | 
			self updateHasUnsavedChanges.
			parentService announceNewService: newService forRequest: requestId ]
		catch: self defaultCatchBlock
]

{ #category : 'actions' }
SpkEvaluatorServiceClient >> cancel [

	"Send a cancel to the server, with the text being canceled, to be recorded so the cancel
	can be undone."

	self flag: #TODO.
	"Cancel operates at the level of an individual evaluator, so should be part of an evaluator service,
	not the workspace service, which can have many evaluators."
	self notYetImplemented: 'Cancel'
]

{ #category : 'actions' }
SpkEvaluatorServiceClient >> debugIt [

	self flag: #TODO.
	"Debug it operates at the level of an individual evaluator, so should be part of an evaluator service,
	not the workspace service, which can have many evaluators."
	self notYetImplemented: 'Debug it'
]

{ #category : 'actions' }
SpkEvaluatorServiceClient >> doIt [

	self flag: #TODO.
	"Do it operates at the level of an individual evaluator, so should be part of an evaluator service,
	not the workspace service, which can have many evaluators."
	self notYetImplemented: 'Do it'
]

{ #category : 'actions' }
SpkEvaluatorServiceClient >> formatCode [

	self flag: #TODO.
	"formatCode operates at the level of an individual evaluator, so should be part of an evaluator service,
	not the workspace service, which can have many evaluators."
	self notYetImplemented: 'Format Code'
]

{ #category : 'accessing' }
SpkEvaluatorServiceClient >> hasUnsavedChanges [

	^ hasUnsavedChanges ifNil: [ self updateHasUnsavedChanges ]
]

{ #category : 'accessing' }
SpkEvaluatorServiceClient >> newSourceCode: aString [

	super newSourceCode: aString.
	self updateHasUnsavedChanges
]

{ #category : 'actions' }
SpkEvaluatorServiceClient >> redo [

	"Need to coordinate local redo operations (simple typing and the like) with operations that require
	the server, such as redoing an accept or cancel. It's not yet clear exactly how to hook that together."

	self notYetImplemented: 'Redo'
]

{ #category : 'actions' }
SpkEvaluatorServiceClient >> undo [

	"Need to coordinate local undo operations (simple typing and the like) with operations that require
	the server, such as undoing an accept or cancel. It's not yet clear exactly how to hook that together.
	It seems like undo/redo should operate on the scope of the entire workspace window, not on the level
	of an individual pane."

	self notYetImplemented: 'Undo'
]

{ #category : 'actions' }
SpkEvaluatorServiceClient >> updateHasUnsavedChanges [

	| nowHaveUnsavedChanges |
	nowHaveUnsavedChanges := oldSourceCode ~= newSourceCode.
	nowHaveUnsavedChanges ~= hasUnsavedChanges ifTrue: [ 
		hasUnsavedChanges := nowHaveUnsavedChanges.
		self announce:
			(SpkUnsavedChangesAnnouncement hasUnsavedChanges: hasUnsavedChanges) ].
	^ hasUnsavedChanges
]

{ #category : 'as yet unclassified' }
SpkEvaluatorServiceClient >> updateServices [

	"Can be sent in any thread."

	updatedInspectors do: [ :each | each announceUpdate ].
	updatedInspectors := Set new
]
