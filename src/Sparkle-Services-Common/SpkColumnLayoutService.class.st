"
I represent the layout of a column within an SpkExplorer window, in a way that can be transmitted to and from the server independently of the pane services themselves, since the pane services must know nothing of the UI they live to serve.
 
**Internal Representation and Key Implementation Points.**

**Instance Variables**
* paneLayouts:			<OrderedCollection of SpkPaneLayoutService> Layout of the panes in the column
* relativeWidth:		<Number>	A positive number indicating the width of the column. See below.


**Implementation Points**

The relative width, together with the relative widths of the other columns in this window, can be used to calculate the actual width of this columns and the actual height of panes. These numbers are not in any unit, but are relative to each other. For example, if column A has a relativeWidth of 13, and column B has a relativeWidth of 24, column B will be slightly less than twice as wide as column A.
An individual column will have the pixel width 
`relativeWidth * (windowWidth / <sumOfAllColumnRelativeWidths>)`
"
Class {
	#name : 'SpkColumnLayoutService',
	#superclass : 'RsrService',
	#instVars : [
		'relativeWidth',
		'paneLayouts'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkColumnLayoutService class >> templateClassName [

	^ #SpkColumnLayoutService
]

{ #category : 'adding' }
SpkColumnLayoutService >> addPaneLayout: aPaneLayoutService [

	paneLayouts add: aPaneLayoutService
]

{ #category : 'initialization' }
SpkColumnLayoutService >> initialize [

	super initialize.
	paneLayouts := OrderedCollection new
]

{ #category : 'accessing' }
SpkColumnLayoutService >> paneLayouts [
	^ paneLayouts
]

{ #category : 'accessing' }
SpkColumnLayoutService >> relativeWidth [
	^ relativeWidth
]

{ #category : 'accessing' }
SpkColumnLayoutService >> relativeWidth: anObject [
	relativeWidth := anObject
]
