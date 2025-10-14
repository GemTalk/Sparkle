Class {
	#name : 'SpkTonelLauncher',
	#superclass : 'SpkApplication',
	#category : 'Sparkle-Application',
	#package : 'Sparkle-Application'
}

{ #category : 'world menu' }
SpkTonelLauncher class >> menuCommandOn: aBuilder [
	"Add a custom menu item to the world menu"

	<worldMenu>
	(aBuilder item: #'Tonel Browser')
		order: 0.8;
		icon: (SpkIconLibrary current iconNamed: #hidePane16);
		parent: #Tools;
		"This appears as the Library menu option for whatever reason"help:
			'Launch a Tonel browser on a directory';
		action: [ self new start ]
]

{ #category : 'running' }
SpkTonelLauncher >> start [

	(self new: SpkTonelLauncherPresenter) open
]
