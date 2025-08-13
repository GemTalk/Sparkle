"
In order for the adornment (the orange triangle in the corner when there are unsaved changes)
to appear, I have to make autoAccept false.
"
Class {
	#name : 'SpMorphicSpkCodeAdapter',
	#superclass : 'SpMorphicTextAdapter',
	#category : 'Sparkle-Spextensions-Adapters',
	#package : 'Sparkle-Spextensions',
	#tag : 'Adapters'
}

{ #category : 'factory' }
SpMorphicSpkCodeAdapter >> buildWidget [

	| newWidget |
	newWidget := (self widgetClass on: self)
		             getTextSelector: #getText;
		             setTextSelector: #accept:notifying:;
		             getSelectionSelector: #readSelection;
		             menuProvider: self selector: #codePaneMenu:shifted:;
		             setSelectionSelector: #setSelection:;
		             ghostText: self placeholder;
		             beWrapped;
		             askBeforeDiscardingEdits: false;
		             autoAccept: true;
		             vResizing: #spaceFill;
		             hResizing: #spaceFill;
		             setBalloonText: self help;
		             dragEnabled: self dragEnabled;
		             dropEnabled: self dropEnabled;
		             registerScrollChanges: #scrollValueChanged:;
		             hScrollbarShowWhenNeeded;
		             withAdornment;
		             yourself.

	self setEnabled: self presenter isEnabled to: newWidget.
	self setEditable: self presenter isEditable to: newWidget.
	self setEditingModeFor: newWidget.
	self setText: self presenter text to: newWidget.
	self presenter selectionInterval ifNotNil: [ :anInterval |
		self selectionInterval: anInterval on: newWidget ].

	self setWrapWord: self presenter isWrapWord to: newWidget.
	self setUndoRedo: self presenter hasUndoRedoHistory to: newWidget.
	self presenter whenTextChangedDo: [ :text |
		self setText: text to: newWidget ].
	self presenter whenSelectionChangedDo: [ :selectionInterval |
		self selectionInterval: selectionInterval ].
	self presenter whenPlaceholderChangedDo: [ :text |
		self setGhostText: text to: newWidget ].
	self presenter whenEditableChangedDo: [ :value |
		self setEditable: value to: newWidget ].
	self presenter whenWrapWordChangedDo: [ :value |
		self setWrapWord: value to: newWidget ].

	^ newWidget
]

{ #category : 'spec protocol' }
SpMorphicSpkCodeAdapter >> hasUnacceptedEdits: aBoolean [

	self model hasUnacceptedEdits: aBoolean
]

{ #category : 'spec protocol' }
SpMorphicSpkCodeAdapter >> pendingText: aText [

	self widgetDo: [ :w | 
		w 
			setText: aText;
			hasUnacceptedEdits: true ]
]

{ #category : 'spec protocol' }
SpMorphicSpkCodeAdapter >> setHasUnacceptedEdits: aBoolean [

	self widgetDo: [ :w | w basicHasUnacceptedEdits: aBoolean ]
]

{ #category : 'factory' }
SpMorphicSpkCodeAdapter >> widgetClass [

	^ SpkScrolledTextMorph
]
