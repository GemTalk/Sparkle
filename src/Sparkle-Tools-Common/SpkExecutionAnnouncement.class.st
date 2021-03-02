"
Execution has occurred. Values in inspectors may have changed.
"
Class {
	#name : 'SpkExecutionAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'updatedInspectors'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkExecutionAnnouncement >> updatedInspectors [

	^ updatedInspectors
]

{ #category : 'accessing' }
SpkExecutionAnnouncement >> updatedInspectors: anObject [

	updatedInspectors := anObject
]
