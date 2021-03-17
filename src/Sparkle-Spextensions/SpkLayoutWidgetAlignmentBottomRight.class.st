Class {
	#name : 'SpkLayoutWidgetAlignmentBottomRight',
	#superclass : 'SpkLayoutWidgetAlignment',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'converting' }
SpkLayoutWidgetAlignmentBottomRight >> asMorphicAlign [

	^ #bottomRight
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomRight >> hAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentBottomCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomRight >> hAlignWidgetsAtLeft [

	^ SpkLayoutWidgetAlignmentBottomLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomRight >> hAlignWidgetsAtRight [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomRight >> vAlignWidgetsAtBottom [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomRight >> vAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentCenterRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentBottomRight >> vAlignWidgetsAtTop [

	^ SpkLayoutWidgetAlignmentTopRight uniqueInstance
]
