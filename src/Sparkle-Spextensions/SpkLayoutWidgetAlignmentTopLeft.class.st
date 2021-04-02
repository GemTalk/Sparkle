Class {
	#name : 'SpkLayoutWidgetAlignmentTopLeft',
	#superclass : 'SpkLayoutWidgetAlignment',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'converting' }
SpkLayoutWidgetAlignmentTopLeft >> asMorphicAlign [

	^ #topLeft
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopLeft >> hAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentCenterLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopLeft >> hAlignWidgetsAtLeft [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopLeft >> hAlignWidgetsAtRight [

	^ SpkLayoutWidgetAlignmentTopRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopLeft >> vAlignWidgetsAtBottom [

	^ SpkLayoutWidgetAlignmentBottomLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopLeft >> vAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentCenterLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopLeft >> vAlignWidgetsAtTop [

	^ self
]
