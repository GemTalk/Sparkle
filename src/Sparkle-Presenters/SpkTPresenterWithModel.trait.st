Trait {
	#name : 'SpkTPresenterWithModel',
	#category : 'Sparkle-Presenters-Support',
	#package : 'Sparkle-Presenters',
	#tag : 'Support'
}

{ #category : 'initialization' }
SpkTPresenterWithModel >> initializeServiceTree [
	"Create services to be models for me and the tree of which I am the root. 
	Signal an error if any presenters already have a model.
	Answer my model."

	| m |
	self model ifNotNil: [
		self error: 'My model has already been initialized' ].
	m := self modelClass new.
	self model: m.
	m registerWith: self application connection.
	self childrenDo: [ :child | m addChild: child initializeServiceTree ].
	^ m
]
