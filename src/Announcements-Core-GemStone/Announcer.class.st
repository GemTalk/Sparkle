"
The implementation uses a threadsafe subscription registry, in the sense that registering, unregistering, and announcing from an announcer at the same time in different threads should never cause failures.

GemStone adds a ""delivery error handler"" to catch errors during delivery of announcements.
The default handler invokes the default action for the exception.
The ignore handler ignores the error and simply returns from the #deliver: method.
The report to GCI handler bypasses any default action and immediately returns to the GCI.
A developer can specify a customer block, as desired.
Additionally, one can specify a custom handler around the #announce: message senf and automatically revert to the previous handler afterward.
"
Class {
	#name : 'Announcer',
	#superclass : 'Object',
	#instVars : [
		'registry',
		'deliveryErrorHandler'
	],
	#category : 'Announcements-Core-GemStone'
}

{ #category : 'instance creation' }
Announcer class >> new [

	^super new
		initialize;
		yourself.
]

{ #category : 'announce' }
Announcer >> announce: anAnnouncement [

	| announcement |
	announcement := anAnnouncement asAnnouncement.	
	registry ifNotNil: [
		registry deliver: announcement
		].
	^ announcement
]

{ #category : 'private' }
Announcer >> basicSubscribe: subscription [
	^ registry add: subscription
]

{ #category : 'exception handling' }
Announcer >> defaultDeliveryErrors [
	self deliveryErrorHandler: [ :ex | ex defaultAction ]
]

{ #category : 'exception handling' }
Announcer >> deliveryErrorHandler [
	"Answer the one argument block exception handler to be 
	 used when delivering announcements encounters an error.
	 The argument to the block will be the exception that
	 was thrown (Error or a subclass of it)."

	^ deliveryErrorHandler
]

{ #category : 'exception handling' }
Announcer >> deliveryErrorHandler: aOneArgBlock [
	"Set the exception handler to be used when delivering
	 announcements encounters an error.
	 The argument to the block will be the exception that
	 was thrown (Error or a subclass of it)."

	deliveryErrorHandler := aOneArgBlock
]

{ #category : 'exception handling' }
Announcer >> during: aBlock handleDeliveryErrorsUsing: anExceptionHandler [
	| savedHandler |
	savedHandler := self deliveryErrorHandler.
	self deliveryErrorHandler: anExceptionHandler.
	^ aBlock
		ensure: [ self deliveryErrorHandler: savedHandler ]
]

{ #category : 'testing' }
Announcer >> handleSubscriberClass: eventClass [
	^ self subscriptions 
		ifNil: [ false ]
		ifNotNil: [:subscriptions | subscriptions handleSubscriberClass: eventClass]
]

{ #category : 'testing' }
Announcer >> hasSubscriber: anObject [

	registry subscriptionsOf: anObject do: [:each | ^ true].
	^ false
]

{ #category : 'exception handling' }
Announcer >> ignoreDeliveryErrors [
	self deliveryErrorHandler: [ :ex | ex return ]
]

{ #category : 'initialization' }
Announcer >> initialize [
	super initialize.
	registry := SubscriptionRegistry new.
	self defaultDeliveryErrors.
]

{ #category : 'statistics' }
Announcer >> numberOfSubscriptions [
	^ registry numberOfSubscriptions

]

{ #category : 'deprecated' }
Announcer >> on: anAnnouncementClass do: aValuable [

	self
		deprecated: 'Please use #when:do: instead'
		transformWith: '`@receiver on: `@statements1 do: `@statements2' 
						-> '`@receiver when: `@statements1 do: `@statements2'.
	^ self when: anAnnouncementClass do: aValuable
]

{ #category : 'deprecated' }
Announcer >> on: anAnnouncementClass do: aValuable for: anObject [
	
	self
		deprecated: 'Please use #when:do:for: instead'
		transformWith: '`@receiver on: `@statements1 do: `@statements2 for: `@anObject' 
						-> '`@receiver when: `@statements1 do: `@statements2 for: `@anObject'.
	^ self when: anAnnouncementClass do: aValuable for: anObject
]

{ #category : 'deprecated' }
Announcer >> on: anAnnouncementClass send: aSelector to: anObject [
	self
		deprecated: 'Please use #when:send:to: instead'
		transformWith: '`@receiver on: `@statements1 send: `@statements2 to: `@anObject' 
						-> '`@receiver when: `@statements1 send: `@statements2 to: `@anObject'.
	^ self when: anAnnouncementClass send: aSelector to: anObject
]

{ #category : 'subscription' }
Announcer >> removeSubscription: subscription [
	"Remove the given subscription from the receiver"
	
	^ registry remove: subscription

]

{ #category : 'private' }
Announcer >> replace: subscription with: newOne [
	^ registry replace: subscription with: newOne

]

{ #category : 'exception handling' }
Announcer >> reportToGciOnDeliveryErrors [
	self deliveryErrorHandler: [ :ex | ex _signalGciError ]
]

{ #category : 'deprecated' }
Announcer >> subscribe: anAnnouncementClass do: aValuable [ 
	"Declare that when anAnnouncementClass is raised, aValuable is executed."
	
	self
		deprecated: 'Please use #when:do: instead'
		transformWith: '`@receiver subscribe: `@statements1 do: `@statements2' 
						-> '`@receiver when: `@statements1 do: `@statements2'.
	^ self when: anAnnouncementClass do: aValuable
]

{ #category : 'deprecated' }
Announcer >> subscribe: anAnnouncementClass do: aValuable for: anObject [ 
	"Declare that when anAnnouncementClass is raised, aValuable is executed."
	
	self
		deprecated: 'Please use #when:do:for: instead'
		transformWith: '`@receiver subscribe: `@statements1 do: `@statements2 for: `@anObject' 
						-> '`@receiver when: `@statements1 do: `@statements2 for: `@anObject'.
	^ self when: anAnnouncementClass do: aValuable for: anObject
]

{ #category : 'deprecated' }
Announcer >> subscribe: anAnnouncementClass send: aSelector to: anObject [
	"Declare that when anAnnouncementClass is raised, anObject should receive the message aSelector."
	self
		deprecated: 'Please use #when:send:to: instead'
		transformWith: '`@receiver subscribe: `@statements1 send: `@statements2 to: `@anObject' 
						-> '`@receiver when: `@statements1 send: `@statements2 to: `@anObject'.
	^ self when: anAnnouncementClass send: aSelector to: anObject
]

{ #category : 'accessing' }
Announcer >> subscriptions [

	^ registry
]

{ #category : 'accessing' }
Announcer >> subscriptionsForClass: subscriberClass [
	"Return the list of subscription for a given class"
	^ self subscriptions subscriptionsForClass: subscriberClass
]

{ #category : 'subscription' }
Announcer >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"
	
	registry removeSubscriber: anObject
]

{ #category : 'registration api' }
Announcer >> when: anAnnouncementClass do: aValuable [
	"Declare that when anAnnouncementClass is raised, aValuable is executed.  Pay attention that such method as well as #when:do: should not be used on weak announcer since the block holds the receiver and more strongly."
	
	aValuable hasReceiver ifFalse: [self error: 'Cannot determine aValuable''s subscriber. Use #when:do:for:, instead.'].
	^ self when: anAnnouncementClass do: aValuable for: aValuable receiver
]

{ #category : 'subscription' }
Announcer >> when: anAnnouncementClass do: aValuable for: aSubscriber [
	"Declare that when anAnnouncementClass is raised, aValuable is executed and define the subscriber."
	
	^ registry add: (
		AnnouncementSubscription new 
			announcer: self;
			announcementClass: anAnnouncementClass;
			valuable: aValuable;
			subscriber: aSubscriber;
			yourself)
]

{ #category : 'registration api' }
Announcer >> when: anAnnouncementClass send: aSelector to: anObject [
	"Declare that when anAnnouncementClass is raised, anObject should receive the message aSelector.
    When the message expects one argument (eg #fooAnnouncement:) the announcement is passed as argument.
    When the message expects two arguments (eg #fooAnnouncement:announcer:) both the announcement and 
    the announcer are passed as argument"

	^ self
		when: anAnnouncementClass
		do: (MessageSend receiver: anObject selector: aSelector)
]
