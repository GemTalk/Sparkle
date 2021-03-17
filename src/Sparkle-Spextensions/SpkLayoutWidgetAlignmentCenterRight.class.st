Class {
	#name : 'SpkLayoutWidgetAlignmentCenterRight',
	#superclass : 'SpkLayoutWidgetAlignment',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'converting' }
SpkLayoutWidgetAlignmentCenterRight >> asMorphicAlign [

	^ #rightCenter
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterRight >> hAlignWidgetsAtCenter [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterRight >> hAlignWidgetsAtLeft [

	^ SpkLayoutWidgetAlignmentCenterLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterRight >> hAlignWidgetsAtRight [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterRight >> vAlignWidgetsAtBottom [

	^ SpkLayoutWidgetAlignmentBottomRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterRight >> vAlignWidgetsAtCenter [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentCenterRight >> vAlignWidgetsAtTop [

	^ SpkLayoutWidgetAlignmentTopRight uniqueInstance
]
