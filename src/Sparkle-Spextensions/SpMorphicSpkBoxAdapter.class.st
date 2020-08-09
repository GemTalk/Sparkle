"
To find references to this class, browse references to #SpkAccordianAdapter.

This class is an adapter for a layout like a box layout but with the ability to insert presenters between existing presenters, and remove a presenter at any index.
"
Class {
	#name : 'SpMorphicSpkBoxAdapter',
	#superclass : 'SpMorphicLayoutAdapter',
	#instVars : [
		'layout'
	],
	#category : 'Sparkle-Spextensions-Spec2'
}

{ #category : 'factory' }
SpMorphicSpkBoxAdapter >> add: aPresenter constraints: constraints beforeIndex: anInteger [
	self widgetDo: [ :aPanel | 
		self
			basicAdd: aPresenter
			constraints: constraints
			to: aPanel
			beforeIndex: anInteger ]
]

{ #category : 'private' }
SpMorphicSpkBoxAdapter >> addConstraits: constraints toChild: childMorph [

	"adds constraints by child"

	| theMorph defaultSizing |
	theMorph := self addPadding: constraints padding toMorph: childMorph.
	defaultSizing := constraints isFill
		                 ifTrue: [ #spaceFill ]
		                 ifFalse: [ #shrinkWrap ].
	layout direction isHorizontal
		ifTrue: [ 
			theMorph vResizing: defaultSizing.
			constraints width
				ifNil: [ theMorph hResizing: defaultSizing ]
				ifNotNil: [ :w | 
					theMorph
						hResizing: #rigid;
						width: w ] ]
		ifFalse: [ 
			theMorph hResizing: defaultSizing.
			constraints height
				ifNil: [ theMorph vResizing: defaultSizing ]
				ifNotNil: [ :h | 
					theMorph
						vResizing: #rigid;
						height: h ] ].

	^ theMorph
]

{ #category : 'private' }
SpMorphicSpkBoxAdapter >> addDimensionConstraints: constraints toChild: childMorph [

	"Deal with only height and width here (and padding?)"

	| theMorph |
	theMorph := childMorph. "self addPadding: constraints padding toMorph:"

	layout direction isHorizontal
		ifTrue: [ 
			theMorph vResizing: #spaceFill.
			constraints width
				ifNil: [ theMorph hResizing: #spaceFill ]
				ifNotNil: [ :w | 
					theMorph
						hResizing: #rigid;
						width: w ] ]
		ifFalse: [ 
			theMorph hResizing: #spaceFill.
			constraints height
				ifNil: [ theMorph vResizing: #spaceFill ]
				ifNotNil: [ :h | 
					theMorph
						vResizing: #rigid;
						height: h ] ].

	^ theMorph
]

{ #category : 'private' }
SpMorphicSpkBoxAdapter >> addPadding: aNumber toMorph: aMorph [
	aNumber = 0 ifTrue: [ ^ aMorph ].
	^ layout direction addPadding: aNumber toMorph: aMorph into: self
]

{ #category : 'private' }
SpMorphicSpkBoxAdapter >> applyAlignmentTo: aWidget [

	| alignmentWidget |
	aWidget
		changeTableLayout;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	alignmentWidget := Morph new
		                   changeTableLayout;
		                   color: layout color;
		                   addMorphBack: widget.
	layout isVertical
		ifTrue: [ 
			alignmentWidget listDirection: #topToBottom.
			layout vAlign ifNotNil: [ :align | 
				alignmentWidget wrapCentering: align asMorphicAlign ].
			layout hAlign ifNotNil: [ :align | 
				alignmentWidget listCentering: align asMorphicAlign ] ]
		ifFalse: [ 
			alignmentWidget listDirection: #leftToRight.
			layout vAlign ifNotNil: [ :align | 
				alignmentWidget listCentering: align asMorphicAlign ].
			layout hAlign ifNotNil: [ :align | 
				alignmentWidget wrapCentering: align asMorphicAlign ] ].
	^ alignmentWidget
]

{ #category : 'private' }
SpMorphicSpkBoxAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel [
	"Normally should use #basicAdd:constraints:to:beforeIndex:.
	But this message is sent when first building a non-empty adapter."

	self
		basicAdd: aPresenter
		constraints: constraints
		to: aPanel
		beforeIndex: widget submorphs size + 1
]

{ #category : 'private' }
SpMorphicSpkBoxAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel beforeIndex: anInteger [
	| childMorph |
	childMorph := self buildMorph: aPresenter constraints: constraints.
	aPanel extent: (aPanel width max: childMorph width)
		@ (aPanel height max: childMorph height).
	widget privateAddMorph: childMorph atIndex: anInteger.
	^ childMorph
]

{ #category : 'accessing' }
SpMorphicSpkBoxAdapter >> children [
	^ widget submorphs
]

{ #category : 'factory' }
SpMorphicSpkBoxAdapter >> layout: aLayout [
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
SpMorphicSpkBoxAdapter >> newHorizontal [
	^ self newPanel
		  listDirection: #leftToRight;
		  yourself
]

{ #category : 'factory' }
SpMorphicSpkBoxAdapter >> newPanel [

	^ super newPanel
		  color: layout color;
		  yourself
]

{ #category : 'factory' }
SpMorphicSpkBoxAdapter >> newVertical [
	^ self newPanel
		  listDirection: #topToBottom;
		  yourself
]

{ #category : 'removing' }
SpMorphicSpkBoxAdapter >> removeChild: aPresenter atIndex: anInteger [
	widget removeMorph: (widget submorphs at: anInteger)
]
