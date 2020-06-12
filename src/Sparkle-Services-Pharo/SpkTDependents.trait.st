"
This trait, SpkTDependents, gives an RSR client or server service ways to have dependents, such as Spec2 presenters.
To use SpkTDependents in an RSR client or server service class you need to do the following:

* Define an instance variable 'myDependents' and a the simple getter and setter methods 'myDependents' and 'myDependents:'.
* Add ""uses: SpkTDependents"" to the class definition

Besides the methods in SpkTDependents, you will then also be able to send yourself the messages #changed, #changed:, or #changed:with:, whose implementations are inherited from Object.

Typically, one would want to use SpkTDependents in a client or server service class, not a template class. It *could* be used in a template class if you needed dependents on both the client and server classes. However, you should define the myDependents instvar and accessors in the subclasses, unless the dependents will always be services that can be replicated by RSR.


"
Trait {
	#name : #SpkTDependents,
	#category : #'Sparkle-Services-Pharo-Sparkle-Services-Pharo'
}

{ #category : #dependencies }
SpkTDependents >> addDependent: anObject [
	self dependents add: anObject
]

{ #category : #dependencies }
SpkTDependents >> dependents [
	^ self myDependents
		ifNil: [ | emptyDependents |
			emptyDependents := IdentitySet new.
			self myDependents: emptyDependents.
			emptyDependents ]
]

{ #category : #dependencies }
SpkTDependents >> removeDependent: anObject [
	self dependents
		remove: anObject
		ifAbsent: [ "If not there, already removed" ]
]
