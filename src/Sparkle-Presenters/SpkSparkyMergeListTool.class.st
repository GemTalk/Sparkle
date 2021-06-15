"
presenterList - a list of projects, packages, or classes visible to the user.  Has a current selection.
updatedList - Updated list from the server with new, removed, or updated entities. 

This class's job is to merge the updatedList into the presenterList without disturbing selections unless absolutely necessary. 
"
Class {
	#name : 'SpkSparkyMergeListTool',
	#superclass : 'Object',
	#instVars : [
		'presenterList',
		'updatedList'
	],
	#category : 'Sparkle-Presenters-Support'
}

{ #category : 'instance creation' }
SpkSparkyMergeListTool class >> merge: updated into: existing [

	| inst |
	inst := self new.
	inst
		updatedList: updated;
		presenterList: existing.
	inst merge.
	^ inst
]

{ #category : 'actions' }
SpkSparkyMergeListTool >> addNew [

	updatedList do: [ :each | presenterList items addIfNotPresent: each ]
]

{ #category : 'actions' }
SpkSparkyMergeListTool >> merge [

	presenterList items isEmpty ifTrue: [ 
		presenterList items: updatedList asOrderedCollection.
		^ self ].
	self removeDeleted.
	self addNew.
	self updateRemaining
]

{ #category : 'accessing' }
SpkSparkyMergeListTool >> presenterList [

	^ presenterList
]

{ #category : 'accessing' }
SpkSparkyMergeListTool >> presenterList: anObject [

	presenterList := anObject
]

{ #category : 'actions' }
SpkSparkyMergeListTool >> removeDeleted [

	presenterList items removeAllSuchThat: [ :each | 
		(updatedList includes: each) not ]
]

{ #category : 'actions' }
SpkSparkyMergeListTool >> updateRemaining [

	updatedList do:[:each | 
		| existing |
		existing := presenterList items detect:[:existingItem | existingItem = each] ifNone:[].
		existing ifNotNil: [ existing updateFrom: each ]
		]
]

{ #category : 'accessing' }
SpkSparkyMergeListTool >> updatedList [

	^ updatedList
]

{ #category : 'accessing' }
SpkSparkyMergeListTool >> updatedList: anObject [

	updatedList := anObject
]
