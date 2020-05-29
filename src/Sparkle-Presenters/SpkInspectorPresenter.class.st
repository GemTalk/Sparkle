Class {
	#name : #SpkInspectorPresenter,
	#superclass : #SpPresenter,
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
SpkInspectorPresenter >> initializeWidgets [
	fieldList := self newList.
	fieldList items: #('foo' '32' #what).
	self focusOrder add: fieldList
]

{ #category : #TOREMOVE }
SpkInspectorPresenter >> title [
	^ 'Inspector'
]
