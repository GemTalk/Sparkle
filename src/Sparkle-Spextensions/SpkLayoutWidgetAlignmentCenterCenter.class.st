Class {
	#name : 'SpkLayoutWidgetAlignmentCenterCenter',
	#superclass : 'SpkLayoutWidgetAlignment',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'converting' }
SpkLayoutWidgetAlignmentCenterCenter >> asMorphicAlign [

	^ #center
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterCenter >> hAlignWidgetsAtCenter [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterCenter >> hAlignWidgetsAtLeft [

	^ SpkLayoutWidgetAlignmentCenterLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterCenter >> hAlignWidgetsAtRight [

	^ SpkLayoutWidgetAlignmentCenterRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterCenter >> vAlignWidgetsAtBottom [

	^ SpkLayoutWidgetAlignmentBottomCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterCenter >> vAlignWidgetsAtCenter [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterCenter >> vAlignWidgetsAtTop [

	^ SpkLayoutWidgetAlignmentTopCenter uniqueInstance
]
