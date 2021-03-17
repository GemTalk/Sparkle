Class {
	#name : 'SpkLayoutWidgetAlignmentTopCenter',
	#superclass : 'SpkLayoutWidgetAlignment',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'converting' }
SpkLayoutWidgetAlignmentTopCenter >> asMorphicAlign [

	^ #topCenter
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopCenter >> hAlignWidgetsAtCenter [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopCenter >> hAlignWidgetsAtLeft [

	^ SpkLayoutWidgetAlignmentTopLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopCenter >> hAlignWidgetsAtRight [

	^ SpkLayoutWidgetAlignmentTopRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopCenter >> vAlignWidgetsAtBottom [

	^ SpkLayoutWidgetAlignmentBottomCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopCenter >> vAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentCenterCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopCenter >> vAlignWidgetsAtTop [

	^ self
]
