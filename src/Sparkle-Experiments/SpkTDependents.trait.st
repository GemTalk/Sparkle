"
This trait, SpkTDependents, gives an RSR client or server service ways to have dependents, such as Spec2 presenters.
To use SpkTDependents in an RSR client or server service class you need to do the following:

* Add ""uses: SpkTDependents"" to the class definition

Besides the methods in SpkTDependents, you will then also be able to send yourself the messages #changed, #changed:, or #changed:with:, whose implementations are inherited from Object.

Typically, one would want to use SpkTDependents in a client or server service class, not a template class. The announcer slot that is defined in this trait cannot be replicated by RSR, and RSR will attempt to do so if it is present in a template class.
"
Trait {
	#name : 'SpkTDependents',
	#category : 'Sparkle-Experiments'
}

{ #category : 'dependencies' }
SpkTDependents >> addDependent: anObject [
	self dependents add: anObject
]

{ #category : 'dependencies' }
SpkTDependents >> dependents [
	^ self myDependents
		ifNil: [ | emptyDependents |
			emptyDependents := IdentitySet new.
			self myDependents: emptyDependents.
			emptyDependents ]
]

{ #category : 'dependencies' }
SpkTDependents >> removeDependent: anObject [
	self dependents
		remove: anObject
		ifAbsent: [ "If not there, already removed" ]
]
