Class {
	#name : 'SpkProcessListServiceClient',
	#superclass : 'SpkProcessListService',
	#traits : 'SpkTModel + SpkTPromise',
	#classTraits : 'SpkTModel classTrait + SpkTPromise classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'accessing' }
SpkProcessListServiceClient >> listItems [

	^self processes sorted:
			[:a :b |
				a priority > b priority
					ifTrue: [true]
					ifFalse: [a priority = b priority
									ifTrue: [a nameOrOopHex = b nameOrOopHex
													ifTrue: [a oop < b oop]
													ifFalse: [a nameOrOopHex < b nameOrOopHex]]
									ifFalse: [false]]]
]

{ #category : 'actions' }
SpkProcessListServiceClient >> synchronizeTaskspace [
	"Synchronize everything in the taskspace that has changed."
	
	| promise |
	promise := remoteSelf synchronizeTaskspace.
	promise
		when: [ :ignored |
			self
				updateServices;
				announceActionComplete]
		catch: self defaultCatchBlock
]
