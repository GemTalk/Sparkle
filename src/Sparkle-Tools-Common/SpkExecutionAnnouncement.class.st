"
Execution has occurred. Values in inspectors may have changed.
"
Class {
	#name : 'SpkExecutionAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'updatedServices'
	],
	#category : 'Sparkle-Tools-Common'
}

{ #category : 'accessing' }
SpkExecutionAnnouncement >> addUpdatedService: aService [
	updatedServices add: aService
]

{ #category : 'initialization' }
SpkExecutionAnnouncement >> initialize [
	super initialize.
	updatedServices := Set new.
]

{ #category : 'accessing' }
SpkExecutionAnnouncement >> updatedServices [
	^updatedServices
]

{ #category : 'accessing' }
SpkExecutionAnnouncement >> updatedServices: object [
	updatedServices := object
]
