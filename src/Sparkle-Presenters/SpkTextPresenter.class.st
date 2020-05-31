Class {
	#name : #SpkTextPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'textPane'
	],
	#category : #'Sparkle-Presenters'
}

{ #category : #specs }
SpkTextPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #textPane;
		yourself
]

{ #category : #'model interaction' }
SpkTextPresenter >> hookToModel [
	model addDependent: self.
	self updateFromModel
]

{ #category : #initialization }
SpkTextPresenter >> initializePresenters [
	textPane := self newText
		whenTextChangedDo: [ self textChanged ];
		yourself.
	self focusOrder add: textPane.
	self hookToModel
]

{ #category : #initialization }
SpkTextPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Some Text';
		aboutText: 'Text from Far Away that might change';
		whenWillCloseDo: [ self unhookFromModel ]
]

{ #category : #'accessing model' }
SpkTextPresenter >> setModelBeforeInitialization: aDomainObject [
	model := aDomainObject
]

{ #category : #'event handling' }
SpkTextPresenter >> textChanged [
	"I've been edited, let the model reflect that change"

	model newLocalString: textPane text
]

{ #category : #accessing }
SpkTextPresenter >> textPane [
	^ textPane
]

{ #category : #accessing }
SpkTextPresenter >> textPane: anObject [
	textPane := anObject
]

{ #category : #'model interaction' }
SpkTextPresenter >> unhookFromModel [
	model removeDependent: self
]

{ #category : #'model interaction' }
SpkTextPresenter >> updateFromModel [
	textPane
		text: model string;
		update
]
