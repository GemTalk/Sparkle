Class {
	#name : 'SpkLayoutWidgetAlignmentBottomCenter',
	#superclass : 'SpkLayoutWidgetAlignment',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'converting' }
SpkLayoutWidgetAlignmentBottomCenter >> asMorphicAlign [

	^ #bottomCenter
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomCenter >> hAlignWidgetsAtCenter [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomCenter >> hAlignWidgetsAtLeft [

	^ SpkLayoutWidgetAlignmentBottomLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomCenter >> hAlignWidgetsAtRight [

	^ SpkLayoutWidgetAlignmentBottomRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomCenter >> vAlignWidgetsAtBottom [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomCenter >> vAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentCenterCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomCenter >> vAlignWidgetsAtTop [

	^ SpkLayoutWidgetAlignmentTopCenter uniqueInstance
]
