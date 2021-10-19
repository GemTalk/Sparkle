Trait {
	#name : 'SpkTTwizzledList',
	#instVars : [
		'twizzledList'
	],
	#traits : 'SpkTList',
	#classTraits : 'SpkTList classTrait',
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'initialization' }
SpkTTwizzledList >> initializeTwizzledList [

	self initializeList.
	twizzledList := self instantiate: SpkTwizzledPresenter.
	twizzledList
		subPresenter: list;
		showSubPresenter: true
]

{ #category : 'initialization' }
SpkTTwizzledList >> refreshTwizzledList [

	| listCount |
	listCount := listModel size.
	self
		refreshListModel;
		refreshList.
	listCount ~= listModel size
		ifTrue: [ self updateLinkedPaneCoordinates ].
	twizzledList labelString: self listLabelString.
]

{ #category : 'accessing' }
SpkTTwizzledList >> twizzledList [

	^ twizzledList
]
