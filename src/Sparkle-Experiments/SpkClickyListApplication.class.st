Class {
	#name : 'SpkClickyListApplication',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Experiments'
}

{ #category : 'activation' }
SpkClickyListApplication class >> applicationName [
	^ 'A list you can click'
]

{ #category : 'running' }
SpkClickyListApplication >> start [
	SpkClickyListPresenter basicNew
		application: self;
		setModelBeforeInitialization: SpkClickyList withTestContents;
		initialize;
		openWithSpec
]
