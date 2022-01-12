Class {
	#name : 'SpMorphicSpkTableCellBuilder',
	#superclass : 'SpMorphicTableCellBuilder',
	#category : 'Sparkle-Spextensions-Table'
}

{ #category : 'visiting' }
SpMorphicSpkTableCellBuilder >> newIconButton [

	^ dataSource newIconButton
]

{ #category : 'visiting' }
SpMorphicSpkTableCellBuilder >> visitButtonColumn: aTableColumn [

	| presenter morph |
	presenter := self newIconButton.
	presenter icon: (aTableColumn readObject: self item).

	aTableColumn action ifNotNil: [ 
		presenter action: [ aTableColumn action value: self item ] ].

	morph := presenter buildWithSpec.
	presenter adapter applyStyle: morph.

	self addCellMorph: morph column: aTableColumn
]
