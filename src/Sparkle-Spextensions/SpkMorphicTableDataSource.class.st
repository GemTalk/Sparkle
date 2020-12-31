Class {
	#name : 'SpkMorphicTableDataSource',
	#superclass : 'SpMorphicTableDataSource',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'accessing' }
SpkMorphicTableDataSource >> cellClass [

	^ SpkCellMorph
]

{ #category : 'accessing' }
SpkMorphicTableDataSource >> cellColumn: column row: rowIndex [
	| cell builder |

	cell := self cellClass new.
	builder := SpMorphicTableCellBuilder on: self.
	builder 
		cell: cell;
		rowIndex: rowIndex;
		visit: column model.
	self setHeaderColumnLazyProperties: column.
		
	^ cell
]
