Class {
	#name : 'SpkLayoutWidgetAlignmentBottomLeft',
	#superclass : 'SpkLayoutWidgetAlignment',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'converting' }
SpkLayoutWidgetAlignmentBottomLeft >> asMorphicAlign [

	^ #bottomLeft
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomLeft >> hAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentBottomCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomLeft >> hAlignWidgetsAtLeft [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomLeft >> hAlignWidgetsAtRight [

	^ SpkLayoutWidgetAlignmentBottomRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomLeft >> vAlignWidgetsAtBottom [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomLeft >> vAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentCenterLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomLeft >> vAlignWidgetsAtTop [

		^ SpkLayoutWidgetAlignmentTopLeft uniqueInstance
]
