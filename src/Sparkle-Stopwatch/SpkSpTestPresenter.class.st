Class {
	#name : 'SpkSpTestPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'startStopButton'
	],
	#category : 'Sparkle-Stopwatch-SpecTest',
	#package : 'Sparkle-Stopwatch',
	#tag : 'SpecTest'
}

{ #category : 'layout' }
SpkSpTestPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
]

{ #category : 'accessing' }
SpkSpTestPresenter >> iconNamed: aSymbol [

	^ self iconProvider iconNamed: aSymbol
]

{ #category : 'instance creation' }
SpkSpTestPresenter >> iconProvider [

	^ SpkIconLibrary current
]

{ #category : 'initialization' }
SpkSpTestPresenter >> initializePresenters [

	| hLayout |
	super initializePresenters.
	hLayout := SpBoxLayout newHorizontal.
	self layout add: hLayout.
	startStopButton := self newIconButton
		                   icon: (self iconNamed: #proceed96);
		                   help: 'Start Stopwatch';
		                   action: [ self startStopwatch ];
		                   yourself.
	hLayout add: startStopButton "withConstraints: [ :c | c width: 96]".
	self layout add: hLayout "withConstraints: [ :c | c height: 96 ]"
]
