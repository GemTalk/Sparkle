Class {
	#name : #SpkInspectorPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'fieldList',
		'descriptiveText'
	],
	#category : #'Sparkle-Presenters'
}

{ #category : #specs }
SpkInspectorPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #fieldList;
		add: #descriptiveText;
		yourself
]

{ #category : #accessing }
SpkInspectorPresenter >> fieldList [
	^ fieldList
]

{ #category : #initialization }
SpkInspectorPresenter >> initializePresenters [
	fieldList := self newList.
	fieldList items: #('foo' '32' #what).
	self focusOrder add: fieldList
]

{ #category : #TOREMOVE }
SpkInspectorPresenter >> title [
	^ 'Inspector'
]
