Class {
	#name : 'SpkStopwatchLauncher',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Stopwatch-Code',
	#package : 'Sparkle-Stopwatch',
	#tag : 'Code'
}

{ #category : 'world menu' }
SpkStopwatchLauncher class >> menuCommandOn: aBuilder [
	"Add a custom menu item to the world menu"

	<worldMenu>
	(aBuilder item: #'Stopwatch')
		order: 0.7;
		icon: (SpkIconLibrary current iconNamed: #proceed28);
		parent: #Tools;
		"This appears as the Library menu option for whatever reason"help:
			'Launch a Stopwatch';
		action: [ self new start ]
]

{ #category : 'running' }
SpkStopwatchLauncher >> start [

	(self new: SpkStopwatchLauncherPresenter) open
]
