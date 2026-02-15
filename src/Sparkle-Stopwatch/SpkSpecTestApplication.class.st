Class {
	#name : 'SpkSpecTestApplication',
	#superclass : 'SpApplication',
	#category : 'Sparkle-Stopwatch-SpecTest',
	#package : 'Sparkle-Stopwatch',
	#tag : 'SpecTest'
}

{ #category : 'world menu' }
SpkSpecTestApplication class >> menuCommandOn: aBuilder [
	"Add a custom menu item to the world menu"

	<worldMenu>
	(aBuilder item: #'SpecTest')
		order: 0.5;
		icon: (SpkIconLibrary current iconNamed: #proceed28);
		parent: #Tools;
		"This appears as the Library menu option for whatever reason"help:
			'Launch the test of Spec2';
		action: [ self new start ]
]

{ #category : 'running' }
SpkSpecTestApplication >> start [

	(self new: SpkSpTestPresenter) open
]
