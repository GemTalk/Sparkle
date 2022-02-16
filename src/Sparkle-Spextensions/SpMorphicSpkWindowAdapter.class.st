Class {
	#name : 'SpMorphicSpkWindowAdapter',
	#superclass : 'SpMorphicWindowAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkWindowAdapter >> buildWidget [

	^ SpkWindow new
		model: model;
		isResizeable: self isResizeable;
		in: [ :this | self subscribeToAnnouncements: this ];
		yourself
]
