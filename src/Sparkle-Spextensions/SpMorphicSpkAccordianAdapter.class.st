Class {
	#name : 'SpMorphicSpkAccordianAdapter',
	#superclass : 'SpMorphicLayoutAdapter',
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'adding' }
SpMorphicSpkAccordianAdapter >> add: aPresenter constraints: constraints beforeIndex: anInteger [
	self widgetDo: [ :aPanel | 
		self
			basicAdd: aPresenter
			constraints: constraints
			to: aPanel
			beforeIndex: anInteger ]
]

{ #category : 'adding' }
SpMorphicSpkAccordianAdapter >> addConstraints: constraints toChild: childMorph [

	"adds constraints by child"

	| theMorph defaultSizing |
	theMorph := self addPadding: constraints padding toMorph: childMorph.


	defaultSizing := constraints isFill
		                 ifTrue: [ #spaceFill ]
		                 ifFalse: [ #shrinkWrap ].
	theMorph
		hResizing: defaultSizing;
		vResizing: defaultSizing.
	constraints width ifNotNil: [ :w | 
		theMorph
			hResizing: #rigid;
			width: w ].
	constraints height ifNotNil: [ :h | 
		theMorph
			vResizing: #rigid;
			height: h ].

	^ theMorph
]

{ #category : 'adding' }
SpMorphicSpkAccordianAdapter >> addPadding: aNumber toMorph: aMorph [
	aNumber = 0 ifTrue: [ ^ aMorph ].
	^ layout direction addPadding: aNumber toMorph: aMorph into: self
]

{ #category : 'adding' }
SpMorphicSpkAccordianAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel [

	"Normally should use #basicAdd:constraints:to:beforeIndex:.
	But this message is sent when first building a non-empty adapter."

	| physicalSize logicalIndex |
	physicalSize := aPanel submorphs size.
	logicalIndex := physicalSize + physicalSize sign / 2 + 1.
	self
		basicAdd: aPresenter
		constraints: constraints
		to: aPanel
		beforeIndex: logicalIndex
]

{ #category : 'adding' }
SpMorphicSpkAccordianAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel beforeIndex: logicalIndex [

	"The given logical index does not take into account the splitter morphs.
	Must adjust the index, and also add a splitter if this is not the only child."

	| physicalIndex childMorph |
	physicalIndex := logicalIndex * 2 - 1.
	childMorph := self buildMorph: aPresenter constraints: constraints.
	aPanel extent: (aPanel width max: childMorph width)
		@ (aPanel height max: childMorph height).

	aPanel submorphs isEmpty
		ifTrue: [ aPanel privateAddMorph: childMorph atIndex: physicalIndex ]
		ifFalse: [ 
			| splitterMorph |
			splitterMorph := SpkSplitterMorph withIndex: logicalIndex.
			"If we are adding the last child, put splitter before. Otherwise, splitter goes after."
			aPanel submorphs size < physicalIndex
				ifTrue: [ 
					aPanel
						privateAddMorph: splitterMorph atIndex: physicalIndex - 1;
						privateAddMorph: childMorph atIndex: physicalIndex ]
				ifFalse: [ 
					aPanel
						privateAddMorph: childMorph atIndex: physicalIndex;
						privateAddMorph: splitterMorph atIndex: physicalIndex + 1 ] ].
	^ childMorph
]

{ #category : 'accessing' }
SpMorphicSpkAccordianAdapter >> layout: aLayout [

	layout := aLayout.
	widget ifNil: [ 
		widget := aLayout direction newWidgetOn: self.
		widget
			changeLinearLayout;
			borderWidth: aLayout borderWidth;
			layoutClass: SpkAccordianLinearLayout;
			cellPositioning: layout widgetAlignment asMorphicAlign ].
	aLayout whenChildrenAddedDo: [ :ann | 
		self
			add: ann child
			constraints: (aLayout constraintsFor: ann child)
			beforeIndex: ann index ].
	aLayout whenChildrenRemovedDo: [ :ann | 
		self removeChild: ann child atIndex: ann index ].
	super layout: aLayout
]

{ #category : 'instance creation' }
SpMorphicSpkAccordianAdapter >> newHorizontal [

	^ self newPanel
		  coordinateTransform: SpkHorizontalTransform uniqueInstance;
		  yourself
]

{ #category : 'instance creation' }
SpMorphicSpkAccordianAdapter >> newPanel [

	^ self widgetClass new
		  changeLinearLayout;
		  hResizing: #spaceFill;
		  vResizing: #spaceFill;
		  color: layout color;
		  borderColor: Color transparent;
		  clipSubmorphs: true;
		  "stop being grabbed"beSticky;
		  borderWidth: 0;
		  extent: 0 @ 0;
		  yourself
]

{ #category : 'instance creation' }
SpMorphicSpkAccordianAdapter >> newVertical [

	^ self newPanel
		  coordinateTransform: SpkVerticalTransform uniqueInstance;
		  yourself
]

{ #category : 'removing' }
SpMorphicSpkAccordianAdapter >> removeChild: aPresenter atIndex: logicalIndex [

	"The given logical index does not take into account the splitter morphs.
	Must adjust the index, and also remove a splitter if this is not the only child."

	widget removeMorph: (widget submorphs at: logicalIndex)
]

{ #category : 'private' }
SpMorphicSpkAccordianAdapter >> widgetClass [

	^ SpkAccordianLayoutMorph
]
