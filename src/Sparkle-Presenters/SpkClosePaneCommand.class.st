Class {
	#name : 'SpkClosePaneCommand',
	#superclass : 'SpkCloseCommand',
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'default' }
SpkClosePaneCommand class >> defaultDescription [
	^ 'Close this pane and remove it from the explorer window'
]

{ #category : 'defaults' }
SpkClosePaneCommand class >> defaultName [

	^ 'Close pane'
]
