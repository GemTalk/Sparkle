Class {
	#name : 'SpMorphicSpkTableAdapter',
	#superclass : 'SpMorphicTableAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkTableAdapter >> buildWidget [

	widget := SpkTableMorph new
		          hResizing: #spaceFill;
		          vResizing: #spaceFill;
		          intercellSpacing: self class intercellSpacing;
		          setMultipleSelection: self model isMultipleSelection;
		          yourself.

	self addModelTo: widget.

	^ widget
]

{ #category : 'private factory' }
SpMorphicSpkTableAdapter >> newDataSource [

	^ SpkMorphicTableDataSource new
		  model: self model;
		  yourself
]
