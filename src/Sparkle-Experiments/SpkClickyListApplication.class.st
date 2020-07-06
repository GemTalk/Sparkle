Class {
	#name : 'SpkClickyListApplication',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Experiments'
}

{ #category : 'activation' }
SpkClickyListApplication class >> applicationName [
	^ 'A list you can click'
]

{ #category : 'examples' }
SpkClickyListApplication class >> example [
	<example>
	self open
]

{ #category : 'running' }
SpkClickyListApplication >> start [
	| model |
	model := SpkClickyList withTestContents.
	2
		timesRepeat: [ SpkClickyListPresenter openForApplication: self onModel: model ]
]
