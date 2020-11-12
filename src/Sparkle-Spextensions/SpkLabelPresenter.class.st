Class {
	#name : 'SpkLabelPresenter',
	#superclass : 'SpLabelPresenter',
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkLabelPresenter class >> adapterName [

	^ #SpkLabelAdapter
]

{ #category : 'initialization' }
SpkLabelPresenter >> initialize [

	super initialize.
	self addStyle: 'label'
]
