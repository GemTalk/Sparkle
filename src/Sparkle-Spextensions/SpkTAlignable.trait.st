"
Intended to be used only in classes that also use SpTAlignable.
Extends that trait to include full-justified alignment.
"
Trait {
	#name : 'SpkTAlignable',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'accessing' }
SpkTAlignable >> hAlignJustified [

	self hAlign: SpkLayoutWidgetAlignmentJustified uniqueInstance
]

{ #category : 'accessing' }
SpkTAlignable >> vAlignJustified [

	self vAlign: SpkLayoutWidgetAlignmentJustified uniqueInstance
]
