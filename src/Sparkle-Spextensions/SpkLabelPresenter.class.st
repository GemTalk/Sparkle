"
A label that is always centered vertically, and may be horizontally aligned either left, center, or right.
"
Class {
	#name : 'SpkLabelPresenter',
	#superclass : 'SpLabelPresenter',
	#instVars : [
		'emphasis'
	],
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkLabelPresenter class >> adapterName [

	^ #SpkLabelAdapter
]

{ #category : 'accessing' }
SpkLabelPresenter >> emphasis [
	^ emphasis
]

{ #category : 'accessing' }
SpkLabelPresenter >> emphasis: anObject [
	emphasis := anObject
]

{ #category : 'initialization' }
SpkLabelPresenter >> initialize [

	super initialize.
	emphasis := TextEmphasis normal
]
