Class {
	#name : 'SpkLayoutServiceClient',
	#superclass : 'SpkLayoutService',
	#traits : 'SpkTModel',
	#classTraits : 'SpkTModel classTrait',
	#category : 'Sparkle-Services-PharoClient-Services'
}

{ #category : 'adding' }
SpkLayoutServiceClient >> addPane: aPaneService beforePosition: positionInColumn inColumn: columnNumber [

	| paneIndex |
	"The given column must already exist."
	(columnNumber between: 1 and: self numberOfColumns) ifFalse: [ 
		self error: 'Column out of range' ].
	paneIndex := positionInColumn.
	1 to: columnNumber - 1 do: [ :eachColumn | 
		paneIndex := paneIndex + (panesPerColumn at: eachColumn) ].
	paneServices add: aPaneService beforeIndex: paneIndex.
	paneRelativeHeights add: 1 beforeIndex: paneIndex.
	panesPerColumn
		at: columnNumber
		put: (panesPerColumn at: columnNumber) + 1
]
