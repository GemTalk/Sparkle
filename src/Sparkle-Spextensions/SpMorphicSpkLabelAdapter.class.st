"
I adapt an SpkLabelPresenter to Morphic. In addition to what my superclass does, I
* Build the LabelMorph with horizontal shrinkWrap so there is more control over the placement of a label within its layout.
* Apply any text emphasis (bold, italic...) that is specified by my presenter. 
"
Class {
	#name : 'SpMorphicSpkLabelAdapter',
	#superclass : 'SpMorphicLabelAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'factory' }
SpMorphicSpkLabelAdapter >> buildWidget [

	| label |
	label := SpkLabelMorph new model: self.
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
