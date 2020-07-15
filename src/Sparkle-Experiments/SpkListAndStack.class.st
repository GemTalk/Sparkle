Class {
	#name : 'SpkListAndStack',
	#superclass : 'SpkModel',
	#instVars : [
		'list',
		'stack'
	],
	#category : 'Sparkle-Experiments'
}

{ #category : 'initialization' }
SpkListAndStack >> initialize [
	list := SpkClickyList withTestContents
]
