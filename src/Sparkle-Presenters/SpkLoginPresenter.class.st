"
I control the presenters in the Sparkle login window. 

Accepts host / port. Connects to a server. Opens a server workspace when connected. 

SparkleLogin - The application window that holds me. 

SparkleLogin class>>example
"
Class {
	#name : 'SpkLoginPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'hostText',
		'portText'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'accessing' }
SpkLoginPresenter >> hostText [

	^ hostText
]

{ #category : 'accessing' }
SpkLoginPresenter >> hostText: anObject [

	hostText := anObject
]

{ #category : 'initialization' }
SpkLoginPresenter >> initializePresenters [
	super initializePresenters.
	hostText := self newTextInput.
	portText := self newTextInput
]

{ #category : 'accessing' }
SpkLoginPresenter >> newLayout [

	^SpkBoxLayout newVertical
]

{ #category : 'accessing' }
SpkLoginPresenter >> portText [

	^ portText
]

{ #category : 'accessing' }
SpkLoginPresenter >> portText: anObject [

	portText := anObject
]
