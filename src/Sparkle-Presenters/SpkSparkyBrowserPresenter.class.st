Class {
	#name : 'SpkSparkyBrowserPresenter',
	#superclass : 'SpkPresenter',
	#instVars : [
		'browserService'
	],
	#classVars : [
		'DebuggerAnnouncer'
	],
	#category : 'Sparkle-Presenters-Presenters'
}

{ #category : 'instance creation' }
SpkSparkyBrowserPresenter >> newLayout [

	^ SpkBoxLayout newVertical
]
