"
A multi-select list with click-on-click-off selection behavior (not standard for Spec2) 
and two-way event passing between presenter and model, so that more than one window can be opened on one model. 
"
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
	self new start
]

{ #category : 'running' }
SpkClickyListApplication >> start [
	| model |
	model := SpkClickyList withTestContents.
	2
		timesRepeat: [ SpkClickyListPresenter openForApplication: self onModel: model ]
]
