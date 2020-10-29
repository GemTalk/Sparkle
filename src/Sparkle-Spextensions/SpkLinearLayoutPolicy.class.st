"
A layout policy for SpkBoxLayouts, laying out submorphs along one axis. Goes hand-in-hand with SpkLayoutProperties.
"
Class {
	#name : 'SpkLinearLayoutPolicy',
	#superclass : 'LayoutPolicy',
	#instVars : [
		'properties'
	],
	#category : 'Sparkle-Spextensions-MorphicLayout'
}

{ #category : 'testing' }
SpkLinearLayoutPolicy >> isLinearLayout [

	^ true
]

{ #category : 'layout' }
SpkLinearLayoutPolicy >> layout: aMorph in: box [

	"Give all the submorphs of aMorph bounds so that they fit in the given box"

	| layout |
	properties := aMorph assureLayoutProperties.
	layout := properties primaryAlignmentClass new.
	layout
		policy: self;
		coordinateTransform: properties coordinateTransform;
		morph: aMorph;
		bounds: box;
		computeLayout
]
