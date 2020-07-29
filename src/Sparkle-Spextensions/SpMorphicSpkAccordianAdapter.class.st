"
To find references to this class, browse references to #SpkOrderedBoxAdapter.

This class is an adapter for a layout like a box layout but with the ability to insert presenters between existing presenters, and remove a presenter at any index.
"
Class {
	#name : 'SpMorphicSpkAccordianAdapter',
	#superclass : 'SpMorphicLayoutAdapter',
	#instVars : [
		'layout'
	],
	#category : 'Sparkle-Spextensions-Spec2'
}

{ #category : 'factory' }
SpMorphicSpkAccordianAdapter >> add: aPresenter constraints: constraints beforeIndex: anInteger [
	self widgetDo: [ :aPanel | 
		self
			basicAdd: aPresenter
			constraints: constraints
			to: aPanel
			beforeIndex: anInteger ]
]

{ #category : 'private' }
SpMorphicSpkAccordianAdapter >> addConstraits: constraints toChild: childMorph [
	"adds constraits by child"

	| theMorph |
	theMorph := self addPadding: constraints padding toMorph: childMorph.
	constraints isExpand
		ifTrue: [ "if is not 'fill', in fact I need to pad it with another (since it 'expands', 
			 but does not 'fills')"
			constraints isFill ifFalse: [ 
				theMorph
					hResizing: #rigid;
					vResizing: #rigid.
				theMorph := self newPanel
					            addMorphBack: theMorph;
					            yourself ].
			"Set to fill"
			theMorph
				hResizing: #spaceFill;
				vResizing: #spaceFill ]
		ifFalse: [ "Set morph to stay rigid"
			layout direction setRigidityOfNonExpandedMorph: theMorph.
			constraints width ifNotNil: [ :w | theMorph width: w ].
			constraints height ifNotNil: [ :h | theMorph height: h ] ].
	^ theMorph
]

{ #category : 'private' }
SpMorphicSpkAccordianAdapter >> addPadding: aNumber toMorph: aMorph [
	aNumber = 0 ifTrue: [ ^ aMorph ].
	^ layout direction addPadding: aNumber toMorph: aMorph into: self
]

{ #category : 'private' }
SpMorphicSpkAccordianAdapter >> applyAlignmentTo: aWidget [
	| alignmentWidget |
	aWidget
		changeTableLayout;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	alignmentWidget := Morph new
		                   changeTableLayout;
		                   color: Color transparent;
		                   addMorphBack: widget.
	layout isVertical
		ifTrue: [ 
			layout vAlign ifNotNil: [ :align | 
				alignmentWidget wrapCentering: align asMorphicAlign ].
			layout hAlign ifNotNil: [ :align | 
				alignmentWidget listCentering: align asMorphicAlign ] ]
		ifFalse: [ 
			layout vAlign ifNotNil: [ :align | 
				alignmentWidget listCentering: align asMorphicAlign ].
			layout hAlign ifNotNil: [ :align | 
				alignmentWidget wrapCentering: align asMorphicAlign ] ].
	^ alignmentWidget
]

{ #category : 'private' }
SpMorphicSpkAccordianAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel [
	"Normally should use #basicAdd:constraints:to:beforeIndex:.
	But this message is sent when first building a non-empty adapter."

	self
		basicAdd: aPresenter
		constraints: constraints
		to: aPanel
		beforeIndex: widget submorphs size + 1
]

{ #category : 'private' }
SpMorphicSpkAccordianAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel beforeIndex: anInteger [
	| childMorph |
	childMorph := self buildMorph: aPresenter constraints: constraints.
	aPanel extent: (aPanel width max: childMorph width)
		@ (aPanel height max: childMorph height).
	widget privateAddMorph: childMorph atIndex: anInteger.
	^ childMorph
]

{ #category : 'accessing' }
SpMorphicSpkAccordianAdapter >> children [
	^ widget submorphs
]

{ #category : 'factory' }
SpMorphicSpkAccordianAdapter >> layout: aLayout [
	layout := aLayout.
	widget ifNil: [ "build of widget was differed up to here (to know what is the direction)"
		widget := aLayout direction newWidgetOn: self.
		widget borderWidth: aLayout borderWidth.
		aLayout hasAlignment ifTrue: [ 
			widget := self applyAlignmentTo: widget ].
		"the spacing needs to be applied to the inner sub-panels"
		widget cellInset: aLayout spacing
		"widget homogeneous: aLayout isHomogeneous" ].
	aLayout whenChildrenAddedDo: [ :ann | 
		self
			add: ann child
			constraints: (aLayout constraintsFor: ann child)
			beforeIndex: ann index ].
	aLayout whenChildrenRemovedDo: [ :ann | self removeChild: ann child atIndex: ann index].
	super layout: aLayout
]

{ #category : 'factory' }
SpMorphicSpkAccordianAdapter >> newHorizontal [
	^ self newPanel
		  listDirection: #leftToRight;
		  yourself
]

{ #category : 'factory' }
SpMorphicSpkAccordianAdapter >> newVertical [
	^ self newPanel
		  listDirection: #topToBottom;
		  yourself
]

{ #category : 'removing' }
SpMorphicSpkAccordianAdapter >> removeChild: aPresenter atIndex: anInteger [
	widget removeMorph: (widget submorphs at: anInteger)
]
