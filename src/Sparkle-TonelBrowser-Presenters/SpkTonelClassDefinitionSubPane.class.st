Class {
	#name : 'SpkTonelClassDefinitionSubPane',
	#superclass : 'SpkTonelClassFileSubPane',
	#category : 'Sparkle-TonelBrowser-Presenters-Subpanes',
	#package : 'Sparkle-TonelBrowser-Presenters',
	#tag : 'Subpanes'
}

{ #category : 'initialization' }
SpkTonelClassDefinitionSubPane >> initializeListColumns [

	self list
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item model key ]);
		addColumn:
			(SpStringTableColumn evaluated: [ :item | item model value ])
]

{ #category : 'api' }
SpkTonelClassDefinitionSubPane >> listItems [

	^ model classPropertyServices
]

{ #category : 'as yet unclassified' }
SpkTonelClassDefinitionSubPane >> listLabelString [

	^ 'Class Properties'
]
