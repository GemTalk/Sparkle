Class {
	#name : 'SpkButtonTableColumn',
	#superclass : 'SpTableColumn',
	#instVars : [
		'action',
		'icon'
	],
	#category : 'Sparkle-Spextensions-Table'
}

{ #category : 'visiting' }
SpkButtonTableColumn >> acceptColumnVisitor: aBuilder [

	^ aBuilder visitButtonColumn: self
]

{ #category : 'accessing' }
SpkButtonTableColumn >> action [

	^ action
]

{ #category : 'accessing' }
SpkButtonTableColumn >> action: anObject [

	action := anObject
]
