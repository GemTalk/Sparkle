"
To find references to this class, browse references to #SpkAccordianAdapter.

This class is an adapter for a layout like a box layout but with the ability to insert presenters between existing presenters, and remove a presenter at any index.
"
Class {
	#name : 'SpMorphicSpkBoxAdapter',
	#superclass : 'SpMorphicLayoutAdapter',
	#classVars : [
		'AlignmentClasses'
	],
	#category : 'Sparkle-Spextensions-Adapters'
}

{ #category : 'private' }
SpMorphicSpkBoxAdapter class >> alignmentClassFor: anAlignment [

	^ AlignmentClasses
		  at: anAlignment asMorphicAlign
		  ifAbsent: [ self error: 'Unsupported alignment' ]
]

{ #category : 'class initialization' }
SpMorphicSpkBoxAdapter class >> initialize [

	"SpMorphicSpkBoxAdapter initialize"

	AlignmentClasses := IdentityDictionary new
		                    at: #center put: SpkLinearLayoutAlignCenter;
		                    at: #bottomRight put: SpkLinearLayoutAlignEnd;
		                    at: #topLeft put: SpkLinearLayoutAlignStart;
		                    at: #justified
		                    put: SpkLinearLayoutAlignJustified;
		                    yourself
]

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
SpMorphicSpkBoxAdapter >> addConstraints: constraints toChild: childMorph [

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

{ #category : 'private' }
SpMorphicSpkBoxAdapter >> addConstraits: constraints toChild: childMorph [

	"adds constraints by child"

	| theMorph defaultSizing |
	self flag:
		'Misspelled selector sent by Spec2 prior to commit 2de7475 of 2020-12-14. 
	Remove this method once that is merged with Pharo 9.'.
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
SpMorphicSpkBoxAdapter >> alignmentClassFor: anAlignment [

	^ self class alignmentClassFor: anAlignment
]

{ #category : 'private' }
SpMorphicSpkBoxAdapter >> applyAlignmentTo: aWidget [

	aWidget changeLinearLayout.
	layout isVertical
		ifTrue: [ 
			layout vAlign ifNotNil: [ :vAlign | 
				aWidget primaryAlignmentClass: (self alignmentClassFor: vAlign) ].
			layout hAlign ifNotNil: [ :hAlign | 
				aWidget cellPositioning: hAlign asMorphicAlign ] ]
		ifFalse: [ 
			layout hAlign ifNotNil: [ :hAlign | 
				aWidget primaryAlignmentClass: (self alignmentClassFor: hAlign) ].
			layout vAlign ifNotNil: [ :vAlign | 
				aWidget cellPositioning: vAlign asMorphicAlign ] ].
	^ aWidget
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
			widget := self applyAlignmentTo: widget ] ].
	aLayout whenChildrenAddedDo: [ :ann | 
		self
			add: ann child
			constraints: (aLayout constraintsFor: ann child)
			beforeIndex: ann index ].
	aLayout whenChildrenRemovedDo: [ :ann | 
		self removeChild: ann child atIndex: ann index ].
	super layout: aLayout
]

{ #category : 'factory' }
SpMorphicSpkBoxAdapter >> newHorizontal [

	^ self newPanel
		  coordinateTransform: SpkHorizontalTransform uniqueInstance;
		  yourself
]

{ #category : 'factory' }
SpMorphicSpkBoxAdapter >> newPanel [

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

{ #category : 'factory' }
SpMorphicSpkBoxAdapter >> newVertical [

	^ self newPanel
		  coordinateTransform: SpkVerticalTransform uniqueInstance;
		  yourself
]

{ #category : 'removing' }
SpMorphicSpkBoxAdapter >> removeChild: aPresenter atIndex: anInteger [
	widget removeMorph: (widget submorphs at: anInteger)
]

{ #category : 'private' }
SpMorphicSpkBoxAdapter >> widgetClass [

	^ SpkLayoutMorph
]
