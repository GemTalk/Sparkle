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

	| theMorph defaultSizing |
	theMorph := childMorph.


	defaultSizing := #spaceFill.
	theMorph
		hResizing: defaultSizing;
		vResizing: defaultSizing.

	constraints sizeIsVariable ifFalse: [ 
		| size |
		size := constraints size.
		layout isHorizontal
			ifTrue: [ 
				theMorph
					hResizing: #rigid;
					width: size ]
			ifFalse: [ 
				theMorph
					vResizing: #rigid;
					height: size ] ].

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

	self
		basicAdd: aPresenter
		constraints: constraints
		to: aPanel
		beforeIndex: widget submorphs size + 1
]

{ #category : 'adding' }
SpMorphicSpkAccordianAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel beforeIndex: anInteger [
	| childMorph |
	childMorph := self buildMorph: aPresenter constraints: constraints.
	aPanel extent: (aPanel width max: childMorph width)
		@ (aPanel height max: childMorph height).
	widget privateAddMorph: childMorph atIndex: anInteger.
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
