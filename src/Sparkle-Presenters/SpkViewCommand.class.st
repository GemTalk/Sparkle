Class {
	#name : 'SpkViewCommand',
	#superclass : 'SpToolCommand',
	#instVars : [
		'viewName'
	],
	#category : 'Sparkle-Presenters-Commands'
}

{ #category : 'accessing - defaults' }
SpkViewCommand class >> defaultName [

	^ 'a view'
]

{ #category : 'execution' }
SpkViewCommand >> execute [

	self context showViewNamed: self name 
]
