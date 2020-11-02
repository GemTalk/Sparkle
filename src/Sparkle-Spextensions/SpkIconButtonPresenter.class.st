Class {
	#name : 'SpkIconButtonPresenter',
	#superclass : 'SpkButtonPresenter',
	#category : 'Sparkle-Spextensions-Presenters'
}

{ #category : 'specs' }
SpkIconButtonPresenter class >> adapterName [

	^ #SpkIconButtonAdapter
]

{ #category : 'api' }
SpkIconButtonPresenter >> icon: aForm [

	"Update after being built"

	super icon: aForm.
	self withAdapterDo: [ :a | a icon: aForm ]
]
