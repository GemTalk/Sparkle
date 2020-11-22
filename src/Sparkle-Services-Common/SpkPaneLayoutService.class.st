"
I represent the layout of a column within an SpkExplorer window, in a way that can be transmitted to and from the server independently of the pane services themselves, since the pane services must know nothing of the UI they live to serve.
 
**Internal Representation and Key Implementation Points**

**Instance Variables**
*	paneCoordinate:		<Array of Number> The vector from an SpkPaneCoordinate
*	paneService:		<RsrService> The service for the pane this layout applies to
*	relativeHeight:		<Number> Relative height of this pane within its column.


**Implementation Points**

See the comment of SpkColumnLayoutService for details of relativeHeight.


"
Class {
	#name : 'SpkPaneLayoutService',
	#superclass : 'RsrService',
	#instVars : [
		'relativeHeight',
		'paneCoordinate',
		'paneService'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkPaneLayoutService class >> templateClassName [

	^ #SpkPaneLayoutService
]

{ #category : 'accessing' }
SpkPaneLayoutService >> paneCoordinate [
	^ paneCoordinate
]

{ #category : 'accessing' }
SpkPaneLayoutService >> paneCoordinate: anObject [
	paneCoordinate := anObject
]

{ #category : 'accessing' }
SpkPaneLayoutService >> paneService [
	^ paneService
]

{ #category : 'accessing' }
SpkPaneLayoutService >> paneService: anObject [
	paneService := anObject
]

{ #category : 'accessing' }
SpkPaneLayoutService >> relativeHeight [
	^ relativeHeight
]

{ #category : 'accessing' }
SpkPaneLayoutService >> relativeHeight: anObject [
	relativeHeight := anObject
]
