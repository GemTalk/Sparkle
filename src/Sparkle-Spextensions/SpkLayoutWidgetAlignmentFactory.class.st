"
A factory that you can send messages to get unique instances of subclasses of SpkLayoutWidgetAlignment.

The default is to center both horizontally and vertically. All of the instances returned by these messages center in at least one axis. Send a subsequent message to that object if you need something that is not centered in either axis.

Public API and Key Messages

- default               
     -- centered in both axes   
- vAlignWidgetsAtTop    
     -- centered horizontally, vertically aligned to the top of container
- vAlignWidgetsAtTop hAlignWidgetsAtRight 
     -- Aligns the top-right corner of a widget to the top-right corner of its container
- hAlignWidgetsAtRight vAlignWidgetsAtTop
     -- Same result as the previous example, just a different path to get there

"
Class {
	#name : 'SpkLayoutWidgetAlignmentFactory',
	#superclass : 'Object',
	#category : 'Sparkle-Spextensions-Layouts'
}

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentFactory class >> default [

	^ SpkLayoutWidgetAlignmentCenterCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentFactory class >> hAlignWidgetsAtCenter [

	^ self default
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentFactory class >> hAlignWidgetsAtLeft [

	^ SpkLayoutWidgetAlignmentCenterLeft uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentFactory class >> hAlignWidgetsAtRight [

	^ SpkLayoutWidgetAlignmentCenterRight uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentFactory class >> vAlignWidgetsAtBottom [

	^ SpkLayoutWidgetAlignmentBottomCenter uniqueInstance
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentFactory class >> vAlignWidgetsAtCenter [

	^ self default
]

{ #category : 'accessing' }
SpkLayoutWidgetAlignmentFactory class >> vAlignWidgetsAtTop [

	^ SpkLayoutWidgetAlignmentTopCenter uniqueInstance
]
