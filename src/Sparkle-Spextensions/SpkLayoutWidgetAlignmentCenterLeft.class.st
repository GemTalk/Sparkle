Class {
	#name : 'SpkLayoutWidgetAlignmentCenterLeft',
	#superclass : 'SpkLayoutWidgetAlignment',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'converting' }
SpkLayoutWidgetAlignmentCenterLeft >> asMorphicAlign [

	^ #leftCenter
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterLeft >> hAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentCenterCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterLeft >> hAlignWidgetsAtLeft [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterLeft >> hAlignWidgetsAtRight [

	^ SpkLayoutWidgetAlignmentCenterRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterLeft >> vAlignWidgetsAtBottom [

	^ SpkLayoutWidgetAlignmentBottomLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterLeft >> vAlignWidgetsAtCenter [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterLeft >> vAlignWidgetsAtTop [

	^ SpkLayoutWidgetAlignmentTopLeft uniqueInstance
]
