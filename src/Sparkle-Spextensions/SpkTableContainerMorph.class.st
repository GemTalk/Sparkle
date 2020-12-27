Class {
	#name : 'SpkTableContainerMorph',
	#superclass : 'FTTableContainerMorph',
	#traits : 'SpkTMorphEnablement',
	#classTraits : 'SpkTMorphEnablement classTrait',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'accessing' }
SpkTableContainerMorph >> rowClass [

	^ SpkTableRowMorph
]

{ #category : 'updating' }
SpkTableContainerMorph >> updateExposedRows [

	"updated (as #updateHeaderRow also) to draw only subset of columns if horizontal scrolling in use, see #exposedColumnsRange:"

	| visibleRows columns columnWidths startIndex |
	self canRefreshValues ifFalse: [ ^ self ].

	visibleRows := self calculateMaxVisibleRows.
	startIndex := self calculateStartIndexWhenShowing: visibleRows.
	columns := self table columns.
	columnWidths := self calculateColumnWidths.

	exposedRows := SmallDictionary new.
	startIndex to: startIndex + visibleRows - 1 do: [ :rowIndex | 
		(self table dataSource hasElementAt: rowIndex) ifTrue: [ 
			| row |
			row := self rowClass table: self table.
			(self exposedColumnsRange: columnWidths) do: [ :columnIndex | 
				| cell |
				cell := self table dataSource
					        cellColumn: (columns at: columnIndex)
					        row: rowIndex.
				cell width: (columnWidths at: columnIndex).
				row addMorphBack: cell ].
			row privateOwner: self.
			exposedRows at: rowIndex put: row ] ]
]
