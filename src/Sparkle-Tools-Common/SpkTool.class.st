"
General services needed by tool objects.
"
Class {
	#name : 'SpkTool',
	#superclass : 'Object',
	#instVars : [
		'announcer'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkTool >> announce: anAnnouncement [

	self announcer announce: anAnnouncement
]

{ #category : 'accessing' }
SpkTool >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'reflection' }
SpkTool >> carefullySend: aSelector withArguments: argArray to: anObject ifNotUnderstood: aBlock [

	| class |
	class := self classOf: anObject.
	^ (class canUnderstand: aSelector)
		  ifTrue: [ 
			  thisContext
				  object: anObject
				  perform: aSelector
				  withArguments: argArray
				  inClass: class ]
		  ifFalse: aBlock
]

{ #category : 'reflection' }
SpkTool >> classOf: anObject [

	"The class is guaranteed to be a Behavior, so we can send it messages that Behavior understands"

	^ thisContext objectClass: anObject
]

{ #category : 'accessing' }
SpkTool >> unsubscribe: anObject [

	self announcer unsubscribe: anObject
]

{ #category : 'accessing' }
SpkTool >> when: anAnnouncementClass send: aSelector to: anObject [

	self announcer when: anAnnouncementClass send: aSelector to: anObject
]
