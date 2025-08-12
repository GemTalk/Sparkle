Class {
	#name : 'SpkButtonTableColumn',
	#superclass : 'SpTableColumn',
	#instVars : [
		'action',
		'icon',
		'enablementCondition'
	],
	#category : 'Sparkle-Spextensions-Table',
	#package : 'Sparkle-Spextensions',
	#tag : 'Table'
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

{ #category : 'accessing' }
SpkButtonTableColumn >> enablementCondition [

	^ enablementCondition ifNil: [ [:x | true ] ]
]

{ #category : 'accessing' }
SpkButtonTableColumn >> enablementCondition: anObject [

	enablementCondition := anObject
]
