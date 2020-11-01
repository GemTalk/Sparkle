"
A label that can be given emphasis (bold, italic, etc.)
"
Class {
	#name : 'SpkLabelPresenter',
	#superclass : 'SpLabelPresenter',
	#instVars : [
		'emphasis',
		'sizeAdjustment'
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
	emphasis := TextEmphasis normal.
	sizeAdjustment := 0
]

{ #category : 'accessing' }
SpkLabelPresenter >> sizeAdjustment [
	^ sizeAdjustment
]

{ #category : 'accessing' }
SpkLabelPresenter >> sizeAdjustment: anObject [
	sizeAdjustment := anObject
]
