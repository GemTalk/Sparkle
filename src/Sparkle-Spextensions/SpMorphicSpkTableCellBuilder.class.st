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
		"addStyle: 'table';"
		
	presenter icon: (presenter iconNamed: #addEvaluator24).
	
	aTableColumn action 
		ifNotNil: [ presenter action: [ aTableColumn action value: self item ] ].

	morph := presenter buildWithSpec.
	presenter adapter applyStyle: morph.

	self 
		addCellMorph: morph
		column: aTableColumn
]
