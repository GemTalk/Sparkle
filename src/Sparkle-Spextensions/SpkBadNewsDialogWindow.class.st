Class {
	#name : 'SpkBadNewsDialogWindow',
	#superclass : 'LongMessageDialogWindow',
	#category : 'Sparkle-Spextensions-Morphic',
	#package : 'Sparkle-Spextensions',
	#tag : 'Morphic'
}

{ #category : 'as yet unclassified' }
SpkBadNewsDialogWindow class >> openOnNews: newsString titled: titleString [

	| dialog |
	dialog := self new entryText: newsString.
	dialog iconMorph formSet: (self iconFormSetNamed: #error).
	dialog title: titleString.
	dialog open.
	dialog textMorph
		minWidth: 20;
		minHeight: 20
]

{ #category : 'actions' }
SpkBadNewsDialogWindow >> newButtons [
	"Answer new buttons as appropriate."

	| shucksButton |
	shucksButton := self newShucksButton isDefault: true.
	^ { shucksButton }
]

{ #category : 'instance creation' }
SpkBadNewsDialogWindow >> newShucksButton [

	^ self theme
		  newButtonIn: self
		  for: self
		  getState: nil
		  action: #ok
		  arguments: nil
		  getEnabled: nil
		  label: 'Shucks' translated
		  help: 'Sigh and close the window' translated
]
