Class {
	#name : 'SpkScrolledCodeMorph',
	#superclass : 'RubScrolledTextMorph',
	#category : 'Sparkle-Spextensions-Morphic',
	#package : 'Sparkle-Spextensions',
	#tag : 'Morphic'
}

{ #category : 'model protocol' }
SpkScrolledCodeMorph >> acceptContents [

	"In a Sparkle context, accepting does not mean that we don't still have unaccepted changes."

	(self autoAccept not and: [ 
		 self canDiscardEdits and: [ self alwaysAccept not ] ]) ifTrue: [ 
		^ self flash ].
	self hasEditingConflicts ifTrue: [ 
		(self confirm: 'Caution! This method may have been
changed elsewhere since you started
editing it here.  Accept anyway?' translated) ifFalse: [ ^ self flash ] ].
	self acceptTextInModel == true ifFalse: [ ^ self ].
	self rulers do: [ :r | r textAccepted ].
	self announcer announce: (RubTextAccepted morph: self)
]

{ #category : 'model protocol' }
SpkScrolledCodeMorph >> basicHasUnacceptedEdits: aBoolean [

	"Ignore autoAccept, which is true for use from Spec2."

	aBoolean = hasUnacceptedEdits ifFalse: [ 
		hasUnacceptedEdits := aBoolean.
		self changed ].
	aBoolean ifFalse: [ hasEditingConflicts := false ]
]

{ #category : 'initialization' }
SpkScrolledCodeMorph >> initialize [

	super initialize.

	"Once things get settled, use a monospaced font."
	self defer: [ self textArea font: StandardFonts codeFont ]
]

{ #category : 'private' }
SpkScrolledCodeMorph >> resetState [

	"In a Sparkle pane, 'accepting' does not mean that the adornment should not be displayed.
	That is under the sole control of the RSR service client."

	self changed
]

{ #category : 'initialization' }
SpkScrolledCodeMorph >> textAreaClass [

	^ SpkEditingArea
]
