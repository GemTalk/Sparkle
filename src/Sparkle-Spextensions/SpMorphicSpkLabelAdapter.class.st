Class {
	#name : 'SpMorphicSpkLabelAdapter',
	#superclass : 'SpMorphicLabelAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkLabelAdapter >> buildWidget [

	| label |
	label := label := LabelMorph new model: self.
	label
		getEnabledSelector: #enabled;
		getTextSelector: #getText;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;
		setBalloonText: self getHelpText;
		setProperty: #minWidth toValue: 3.
	"3 is the default value of StringMorph. We do not want the default value of LabelMorph that is the min width of the content..."
	^ label
]
