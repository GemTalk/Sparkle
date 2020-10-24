"
I represent the layout of an SpkExplorer window, in a way that can be transmitted to and from the server independently of the pane services themselves.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	columnRelativeWidths:		<Array of Number, size = C>
	height:		<Number>
	paneRelativeHeights:		<Array of Number, size = P>
	paneServices:		<Array of RsrService, size = P>
	panesPerColumn:		<Array of Number, size = C>
	width:		<Number>
			
Width and height are the recorded size in pixels of the window presenter at the time the layout. When restoring, this size will be used unless it is larger than the world, in which case the window will fill the world.

The number of columns, C, is the size of the panesPerColumn array.
In the panesPerColumn array, index 1 is the leftmost, index C the rightmost.
An empty column will have a 0 at its index in the panesPerColumn array.

The number of panes, P, must be the sum of the elements of the panesPerColumn array.

The pane arrays are ordered in column-major order -- top pane in left column, pane in left column below it (if any) ... top pane of next column ... bottom pane in rightmost column.

The relative* arrays can be used to calculate the actual width of columns and the actual height of panes. These numbers are not in any unit, but are relative to each other. For example, if pane A has the number k, and pane B has the number 2k, B will be twice as high as A. 
The column with index i will have the pixel width ((columRelativeWidths at: i) * (width / columRelativeWidths sum))

"
Class {
	#name : 'SpkLayoutService',
	#superclass : 'RsrService',
	#instVars : [
		'width',
		'height',
		'panesPerColumn',
		'columnRelativeWidths',
		'paneServices',
		'paneRelativeHeights'
	],
	#category : 'Sparkle-Services-Common'
}

{ #category : 'accessing' }
SpkLayoutService class >> templateClassName [

	^ #SpkLayoutService
]

{ #category : 'accessing' }
SpkLayoutService >> columnRelativeWidths [
	^ columnRelativeWidths
]

{ #category : 'accessing' }
SpkLayoutService >> height [
	^ height
]

{ #category : 'accessing' }
SpkLayoutService >> height: anObject [
	height := anObject
]

{ #category : 'initialization' }
SpkLayoutService >> initialize [

	"Default height and width, two equal columns, no panes."

	super initialize.
	height := width := 900.
	paneServices := OrderedCollection new.
	paneRelativeHeights := OrderedCollection new.
	columnRelativeWidths := #( 1 1 ) asOrderedCollection.
	panesPerColumn := #( 0 0 ) asOrderedCollection
]

{ #category : 'accessing' }
SpkLayoutService >> numberOfColumns [

	^ panesPerColumn size
]

{ #category : 'accessing' }
SpkLayoutService >> paneRelativeHeights [
	^ paneRelativeHeights
]

{ #category : 'accessing' }
SpkLayoutService >> paneServices [
	^ paneServices
]

{ #category : 'accessing' }
SpkLayoutService >> panesInColumn: columnIndex [

	^ panesPerColumn at: columnIndex
]

{ #category : 'accessing' }
SpkLayoutService >> panesPerColumn [
	^ panesPerColumn
]

{ #category : 'accessing' }
SpkLayoutService >> width [
	^ width
]

{ #category : 'accessing' }
SpkLayoutService >> width: anObject [
	^ width := anObject
]
