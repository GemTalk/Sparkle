"
Adapter for action buttons that refuse to accept keyboard focus.
"
Class {
	#name : 'SpMorphicSpkButtonAdapter',
	#superclass : 'SpMorphicButtonAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkButtonAdapter >> newButton [

	^ SpkPluggableButtonMorph
		  on: self
		  getState: #state
		  action: #action
		  label: #label
		  menu: #menu:
]
