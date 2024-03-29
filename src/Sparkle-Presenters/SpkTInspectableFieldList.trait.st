"
Trait for presenters that have lists whose items open linked inspectors when selected.

"
Trait {
	#name : 'SpkTInspectableFieldList',
	#traits : 'SpkTList',
	#classTraits : 'SpkTList classTrait',
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'actions' }
SpkTInspectableFieldList >> itemSelected: anAnnouncement [

	"This announcement comes from the UI, not a service, so does not need to be deferred."

	| field inspectorService |
	field := anAnnouncement item.
	inspectorService := field model
		                    inspectFieldIn: self explorerService
		                    forRequest: field.
	"If nil, a server round trip is required and the inspector pane 
	will be created by announcement from the service."
	inspectorService ifNil: [ self pane disableAll ] ifNotNil: [ 
		field openLinkedPane: inspectorService.
		self refreshList ]
]
