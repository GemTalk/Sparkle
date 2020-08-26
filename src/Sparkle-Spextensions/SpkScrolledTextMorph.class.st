Class {
	#name : 'SpkScrolledTextMorph',
	#superclass : 'RubScrolledTextMorph',
	#category : 'Sparkle-Spextensions-Morphic'
}

{ #category : 'model protocol' }
SpkScrolledTextMorph >> acceptContents [

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
SpkScrolledTextMorph >> basicHasUnacceptedEdits: aBoolean [

	"Ignore autoAccept, which is true for use from Spec2."

	aBoolean = hasUnacceptedEdits ifFalse: [ 
		hasUnacceptedEdits := aBoolean.
		self changed ].
	aBoolean ifFalse: [ hasEditingConflicts := false ]
]

{ #category : 'private' }
SpkScrolledTextMorph >> resetState [

	"In a Sparkle pane, 'accepting' does not mean that the adornment should not be displayed.
	That is under the sole control of the RSR service client."

	self changed
]
