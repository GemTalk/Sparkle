Class {
	#name : 'SpMorphicSpkMenuButtonAdapter',
	#superclass : 'SpMorphicMenuButtonAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkMenuButtonAdapter >> newButton [

	^ SpkPluggableButtonMorph
		  on: self
		  getState: nil
		  action: #action
		  label: #label
		  icon: #icon
		  menu: nil
]
