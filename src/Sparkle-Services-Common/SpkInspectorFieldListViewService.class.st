Class {
	#name : 'SpkInspectorFieldListViewService',
	#superclass : 'SpkInspectorViewService',
	#instVars : [
		'fields'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkInspectorFieldListViewService class >> templateClassName [

	self subclassResponsibility
]

{ #category : 'accessing' }
SpkInspectorFieldListViewService >> fields [

	^ fields
]

{ #category : 'accessing' }
SpkInspectorFieldListViewService >> fields: anObject [

	fields := anObject
]

{ #category : 'initialization' }
SpkInspectorFieldListViewService >> initialize [

	super initialize.
	fields := OrderedCollection new
]

{ #category : 'actions' }
SpkInspectorFieldListViewService >> moveToExplorer: xServ [
	self tool explorerTool: xServ tool.

	fields do: [ :each | each moveToExplorer: xServ ]
]

{ #category : 'private' }
SpkInspectorFieldListViewService >> newFieldServiceFor: aFieldTool [
	^ SpkInspectorFieldServiceServer new
		parentService: self;
		tool: aFieldTool;
		yourself
]

{ #category : 'accessing' }
SpkInspectorFieldListViewService >> numberOfColumns [

	self subclassResponsibility
]
