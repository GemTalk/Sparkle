Class {
	#name : 'SpkLayoutWidgetAlignmentTopRight',
	#superclass : 'SpkLayoutWidgetAlignment',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'converting' }
SpkLayoutWidgetAlignmentTopRight >> asMorphicAlign [

	^ #topRight
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopRight >> hAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentTopCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopRight >> hAlignWidgetsAtLeft [

	^ SpkLayoutWidgetAlignmentTopLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopRight >> hAlignWidgetsAtRight [

	^ self
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopRight >> vAlignWidgetsAtBottom [

	^ SpkLayoutWidgetAlignmentBottomRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopRight >> vAlignWidgetsAtCenter [

	^ SpkLayoutWidgetAlignmentCenterRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentTopRight >> vAlignWidgetsAtTop [

	^ self
]
