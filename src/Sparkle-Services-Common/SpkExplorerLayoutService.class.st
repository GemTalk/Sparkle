"
I represent the layout of an SpkExplorer window, in a way that can be transmitted to and from the server independently of the pane services themselves, since the pane services must know nothing of the UI they live to serve.
 
Internal Representation and Key Implementation Points.

**Instance Variables**
* columnLayouts:		<OrderedCollection of SpkColumnLayoutService> Layouts of the columns in the window
* height:		<Number>	Height in pixels of the explorer window 
* width:		<Number>	Width in pixels of the explorer window


**Implementation Points**


"
Class {
	#name : 'SpkExplorerLayoutService',
	#superclass : 'RsrService',
	#instVars : [
		'explorerService',
		'width',
		'height',
		'columnLayouts'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkExplorerLayoutService class >> templateClassName [

	^ #SpkExplorerLayoutService
]

{ #category : 'adding' }
SpkExplorerLayoutService >> addColumnLayout: aColumnLayoutService [

	columnLayouts add: aColumnLayoutService
]

{ #category : 'accessing' }
SpkExplorerLayoutService >> columnLayouts [
	^ columnLayouts
]

{ #category : 'accessing' }
SpkExplorerLayoutService >> height [
	^ height
]

{ #category : 'accessing' }
SpkExplorerLayoutService >> height: anObject [
	height := anObject
]

{ #category : 'initialization' }
SpkExplorerLayoutService >> initialize [

	super initialize.
	columnLayouts := OrderedCollection new.
	height := width := 900
]

{ #category : 'adding' }
SpkExplorerLayoutService >> removeColumnLayout: aColumnLayoutService [

	columnLayouts remove: aColumnLayoutService
]

{ #category : 'accessing' }
SpkExplorerLayoutService >> width [
	^ width
]

{ #category : 'accessing' }
SpkExplorerLayoutService >> width: anObject [
	width := anObject
]
