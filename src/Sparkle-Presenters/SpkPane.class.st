"
I am an abstract superclass for presenting panes in the Sparkle GUI.

I class take most of the responsibility for formatting the pane header, which is common between different kinds of panes, which are my subclasses.
"
Class {
	#name : 'SpkPane',
	#superclass : 'SpPresenter',
	#category : 'Sparkle-Presenters'
}

{ #category : 'specs' }
SpkPane class >> defaultSpec [

	^ SpBoxLayout newVertical
		"add: self headerLayout;
	   yourself"
]
